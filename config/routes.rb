Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :buyers
  devise_for :brokers
  devise_for :admins

  root to: "welcome#index"

  resources :admins
  resources :brokers
  resources :buyers

  authenticated :broker do
    get '/brokers/:id/', to: 'brokers#show'
    root to: "brokers#show", as: :user_broker
  end

  authenticated :buyer do
    get '/buyers/:id/', to: 'buyers#show'
    root to: "buyers#show", as: :user_buyer
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
