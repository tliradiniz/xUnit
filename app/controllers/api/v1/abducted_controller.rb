module Api
  module V1

    class AbductedController < ApplicationController

      def index
        count_abducted = (Float((Survivor.where.not(status: 'alive').count)) / Float(Survivor.count) * 100).round(2)
        percentage = count_abducted.to_s + '%'

        render json: {status: 'SUCCESS', message: 'Porcentagem de abduzidos', abducted_percentage: percentage}, status: :ok
      end
    end
  end
end

