module Api
  module V1

    class AliveController < ApplicationController

      def index
        count_survivor = ((Float(Survivor.where(status: "alive").count))/Float(Survivor.count)*100).round(2)
        percentage = count_survivor.to_s + "%"

        render json: {status: 'SUCCESS', message:"Porcentagem de sobreviventes" , data:percentage}, status: :ok
      end

    def update
      survivor = Survivor.find(params[:id])
      if survivor.update_attributes(survivor_abduct)
        render json: {status: 'SUCCESS', message:'Número de pessoas que informaram a abdução', data: survivor.missing_count},status: :ok
        if survivor.missing_count > 2
          survivor.update(:status => "abducted")
        else
          survivor.update(:status => "alive")
        end
      else
        render json: {status: 'ERROR', message:'Número inválidon', data:survivor.errors},status: :unprocessable_entity
      end
    end

    private
    def survivor_abduct
      params.permit(:missing_count)
    end
    end
  end


end

