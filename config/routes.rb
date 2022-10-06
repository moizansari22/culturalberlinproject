require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/events', to: 'events#index'
  match 'search_date/events' , to: 'events#search_date' ,via: :get
  root to: 'events#index'
end
