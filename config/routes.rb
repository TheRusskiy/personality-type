Rails.application.routes.draw do

  devise_for :users
  root to: 'root#index'
  
  devise_scope :users do
    get '/auth/:provider/callback', to: 'authentications#create'
  end

  resources :quiz_results do

  end

  get 'static/:page' => 'static#show'
end
