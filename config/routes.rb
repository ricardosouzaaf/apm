Rails.application.routes.draw do

  get 'remessa/index'

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

  match '/lote/generate' => 'lote#generate', :via => [:post], :as => :generate_boleto

  root 'clients#index'

end
