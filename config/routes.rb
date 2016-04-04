Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  get 'chapter/new'
  get 'chapter/show'
  
  post "markdown/preview"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #books
  get 'books/new'
  get 'books/create'
  get 'books/show'

  scope '(:locale)' do
    resources :users
    resources :books do
      resources :chapter
    resources :comments
    end
    match '/profile', to: 'users#profile', via: 'get'
    match '/help', to: 'static_pages#help', via: 'get'
    match '/about', to: 'static_pages#about', via: 'get'  
    match '/contact', to: 'static_pages#contact', via: 'get'
    match 'profile/addbook', to: 'books#new', via: 'get'
    match 'profile/mystories', to: 'users#show_stories', via: 'get'
  end
  root 'static_pages#home'

#  get 'users/show'

  

  
  #get 'users/new'

  
  devise_scope :user do
    get "/login" => "users/sessions#new"
    post "/login" => "users/sessions#create"
    get "/logout" => "users/sessions#destroy"
    get "profile/edit" => "users/registrations#edit"
  end

  

  
  match '/signup',  to: 'users#new', via: 'get'
  


  get '*unmatched_route', :to => 'application#not_found'
end
