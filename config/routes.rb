Rails.application.routes.draw do
  devise_for :buyers
  devise_for :brokers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
