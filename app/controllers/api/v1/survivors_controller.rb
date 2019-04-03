module Api
  module V1
    class SurvivorsController <ApplicationController

      def index
        survivors = Survivor.order('name ASC')
        render json: {status: 'SUCCESS', message:'Carregados', data:survivors}, status: :ok
      end

      def show
        survivor = Survivor.find(params[:id])
        render json: {status: 'SUCCESS', message:'Mostrados', data:survivor},status: :ok

      end

      def create
        survivor = Survivor.new(article_params)
        if survivor.save
          render json: {status: 'SUCCESS', message:'Sobrevivente Criadoo', data:survivor},status: :ok
        else
          render json: {status: 'ERROR', message:'Sobrevivente não criado', data:survivor.errors},status: :unprocessable_entity
        end
      end


      def update
        survivor = Survivor.find(params[:id])
        if survivor.update_attributes(survivor_update)
          render json: {status: 'SUCCESS', message:'Localização atualizada', data:survivor},status: :ok
        else
          render json: {status: 'ERROR', message:'Localização não pode ser atualizada', data:survivor.errors},status: :unprocessable_entity
        end
      end

      private
      def survivor_update
        params.permit(:last_location)
      end



      private
      def article_params
        params.permit(:name, :age, :gender, :last_location)
      end

    end
  end
end
