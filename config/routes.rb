Rails.application.routes.draw do

  resources :crediarios

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

  #match '/lote/generate' => 'lote#generate', :via => [:post], :as => :generate_boleto

  match 'lote/generate' => 'lote#generate', :via => [:get] , :as => 'carnes'

  root 'clients#index'

  match "/lote/printed/:id" => "lote#printed", :via => [:get] , :as => 'impressao'

end
