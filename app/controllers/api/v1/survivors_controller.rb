module Api
  module V1
    class SurvivorsController < ApplicationController

      def index
        survivor = Survivor.order('name ASC')
        render json: {status: 'SUCCESS', survivors_list: survivor}, status: :ok
      end

      def show
        survivor = Survivor.find(params[:id])
        render json: {status: 'SUCCESS', survivor: survivor}, status: :ok

      end

      def create
        survivor = Survivor.new(survivor_params)
        if survivor.save
          render json: {status: 'SUCCESS', message: 'Sobrevivente Criado', new_survivor: survivor}, status: :created
        else
          render json: {status: 'ERROR', message: 'Sobrevivente não criado', survivor_error: survivor.errors}, status: :unprocessable_entity
        end
      end


      def update
        survivor = Survivor.find(params[:id])
        if survivor.update_attributes(survivor_update)
          render json: {status: 'SUCCESS', message: 'Localização atualizada', new_location_survivor: survivor}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Localização não pode ser atualizada', new_location_error: survivor.errors}, status: :unprocessable_entity
        end
      end

      private

      def survivor_update
        params.permit(:last_location)
      end


      private

      def survivor_params
        params.permit(:name, :age, :gender, :last_location)
      end

    end
  end
end
