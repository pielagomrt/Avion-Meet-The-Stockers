Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :admins, :controllers => { :registrations => :registrations }
  devise_for :brokers, :controllers => { :registrations => :registrations }
  devise_for :buyers, path: "", :controllers => { :registrations => :registrations }

  root to: "welcome#index"

  resources :admins
  resources :brokers
  resources :buyers
  resources :stocks
  resources :broker_stocks
  resources :buyer_stocks, only: [:create, :index]

  # for manually creating new broker and buyer accounts
  get 'admins/new/broker' => 'admins#new_broker', as: 'new_broker_admin'
  get 'admins/new/buyer' => 'admins#new_buyer', as: 'new_buyer_admin'
  post 'admins/create_broker' => 'admins#create_broker', as: 'create_broker_admin'
  post 'admins/create_buyer' => 'admins#create_buyer', as: 'create_buyer_admin'

  # for editing broker and buyer accounts
  get 'admins/:id/edit/broker' => 'admins#edit_broker', as: 'edit_broker_admin'
  get 'admins/:id/edit/buyer' => 'admins#edit_buyer', as: 'edit_buyer_admin'
  put 'admins/:id/update_broker' => 'admins#update_broker', as: 'update_broker_admin'
  put 'admins/:id/update_buyer' => 'admins#update_buyer', as: 'update_buyer_admin'


  get 'admins/pending/broker' => 'admins#pending_broker_signup', as: 'pending_broker_signup_admin'
  put 'admins/:id/approve_broker' => 'admins#approve_broker_signup', as: 'approve_broker_admin'

  get 'brokers/:id/portfolio' => 'brokers#show_portfolio', as: 'broker_portfolio'
  get 'buyers/:id/portfolio' => 'buyers#show_portfolio', as: 'buyer_portfolio'

  get 'brokers/:id/transaction' => 'brokers#show_transaction', as: 'broker_transaction'
  get 'buyers/:id/transaction' => 'buyers#show_transaction', as: 'buyer_transaction'
  get 'admins/show/transaction' => 'admins#show_transaction', as: 'all_transactions'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
