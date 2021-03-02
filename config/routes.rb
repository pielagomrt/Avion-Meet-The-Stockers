Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :buyers
  devise_for :brokers
  devise_for :admins

  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
