module Api
  module V1

    class AliveController < ApplicationController

      def index
        count_survivor = ((Float(Survivor.where(status: "alive").count)) / Float(Survivor.count) * 100).round(2)
        percentage = count_survivor.to_s + "%"

        render json: {status: 'SUCCESS', message: "Porcentagem de sobreviventes", data: percentage}, status: :ok
      end


      def create

        abducted_user = AbductedUser.new(survivor_abduct)
        abducted_test = AbductedUser.where('id_user = :id_user AND id_target = :id_target',
                                           {id_user: params[:id_user], id_target: params[:id_target]}).exists?
        survivor = Survivor.find(params[:id_target])
        if abducted_test == true
          render json: {status: 'ERROR', message: 'Esse usuário já informou a abdução desse sobrevivente', data: abducted_user}, status: :unprocessable_entity
        else
          if abducted_user.save
            survivor.increment(:missing_count, 1)
            if survivor.missing_count > 2
              survivor.update(status: "abducted")
            else
              survivor.update(status: "alive")
            end
            render json: {status: 'SUCCESS', message: 'abdução informada com sucesso', data: abducted_user}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Sobrevivente não criado', data: abducted_user.errors}, status: :unprocessable_entity
          end
        end
      end

      private

      def survivor_abduct
        params.permit(:id_user, :id_target)
      end
    end
  end
end
