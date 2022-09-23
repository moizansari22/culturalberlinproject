require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match 'berlins_show/events' , to: 'events#berlins_show' ,via: :get

  match 'calenders_show/events' , to: 'events#calenders_show' ,via: :get

  match 'search_date/events' , to: 'events#search_date' ,via: :get

  root to: 'events#index'
end