Rails.application.routes.draw do

  get 'lote/index'
  get 'lote/generate'

  devise_for :users
  resources :banks

  resources :boletos do
    collection do
      get :generate
      get :generate_many
    end
  end

  resources :clients

  root 'clients#index'

end
