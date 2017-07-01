Rails.application.routes.draw do

  devise_for :users
  root to: 'root#index'
  
  devise_scope :users do
    get '/auth/:provider/callback', to: 'authentications#create'
  end

  get 'static/:page' => 'static#show'
end
