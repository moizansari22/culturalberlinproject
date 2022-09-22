Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :events do
    match '/berlin_website', to: 'events#berlin_website', via: :post, on: :collection
  end
  resources :events do
    match '/calender_website', to: 'events#calender_website', via: :post, on: :collection
  end
  
  match 'berlins_show/events' , to: 'events#berlins_show' ,via: :get

  match 'calenders_show/events' , to: 'events#calenders_show' ,via: :get

  match 'search_date/events' , to: 'events#search_date' ,via: :get

  root to: 'events#index'

 
  

end