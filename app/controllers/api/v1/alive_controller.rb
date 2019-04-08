module Api
  module V1

    class AliveController < ApplicationController
#TODO Atualizar campos em português para Inglês
      def index
        count_survivor = ((Float(Survivor.where(status: 'alive').count)) / Float(Survivor.count) * 100).round(2)
        percentage = count_survivor.to_s + '%'

        render json: {status: 'SUCCESS', message: 'Porcentagem de sobreviventes', data: percentage}, status: :ok
      end


      def create

        abducted_user = AbductedUser.new(survivor_abduct)
        if abducted_user.id_user == abducted_user.id_target
          render json: {status: 'ERROR', message: 'O usuário não pode se declarar abduzido'}, status: :bad_request
        end

        abducted_test = AbductedUser.where('id_user = :id_user AND id_target = :id_target',
                                           {id_user: params[:id_user], id_target: params[:id_target]}).exists?
        if abducted_test == true
          render json: {status: 'ERROR', message: 'Esse usuário já informou a abdução desse sobrevivente'}, status: :bad_request
        end

        if abducted_user.save
          survivor = Survivor.find(params[:id_target])
          survivor.increment(:missing_count, 1)
          if survivor.missing_count > 2
            survivor.update(status: 'abducted')
          end
          render json: {status: 'SUCCESS', message: 'abdução informada com sucesso', abducted_user: abducted_user}, status: :created
        else
          render json: {status: 'ERROR', message: 'Sobrevivente não criado', errors: abducted_user.errors}, status: :unprocessable_entity
        end
      end

      private

      def survivor_abduct
        params.permit(:id_user, :id_target)
      end
    end
  end
end
