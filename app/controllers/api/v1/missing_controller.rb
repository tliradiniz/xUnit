module Api
  module V1

    class MissingController < ApplicationController

      def index
        count_abducted = (Float((Survivor.where.not(status: "alive").count))/Float(Survivor.count)*100)
        percentage = count_abducted.to_s + "%"

        render json: {status: 'SUCCESS', message:"Porcentagem de abduzidos" , data:percentage}, status: :ok
      end
    end
  end
end