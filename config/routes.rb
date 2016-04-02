Rails.application.routes.draw do
  
  #get 'books/new'

  get 'books/create'
  get 'books/show'

  resources :users
  resources :books

  get 'users/show'

  match 'profile/addbook', to: 'books#new', via: 'get'

  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #get 'users/new'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_scope :user do
    get "/login" => "users/sessions#new"
    post "/login" => "users/sessions#create"
    get "/logout" => "users/sessions#destroy"
    get "profile/edit" => "users/registrations#edit"
  end

  root 'static_pages#home'

  match '/profile', to: 'users#profile', via: 'get'
  match '/signup',  to: 'users#new', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'  
  match '/contact', to: 'static_pages#contact', via: 'get'

  get '*unmatched_route', :to => 'application#not_found'
end
