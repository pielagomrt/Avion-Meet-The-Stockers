Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :admins, :controllers => { :registrations => :registrations }
  devise_for :brokers, :controllers => { :registrations => :registrations }
  devise_for :buyers, :controllers => { :registrations => :registrations }

  root to: "welcome#index"

  resources :admins
  resources :brokers
  resources :buyers

  # for manually creating new broker and buyer accounts
  match 'admins/new/broker' => 'admins#new_broker', as: 'new_broker_admin', via: :get
  match 'admins/new/buyer' => 'admins#new_buyer', as: 'new_buyer_admin', via: :get

  # for editing broker and buyer accounts
  match 'admins/:id/edit/broker' => 'admins#edit_broker', as: 'edit_broker_admin', via: :get
  match 'admins/:id/edit/buyer' => 'admins#edit_buyer', as: 'edit_buyer_admin', via: :get
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
