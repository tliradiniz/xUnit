Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :survivors
      resources :alive, only: [:index, :create]
      resources :abducted, only: [:index]

    end
  end
end
