Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  root 'static_pages#home'

  get '/contact', to: 'static_pages#contact'

  get '/about',   to: 'static_pages#about'

  devise_for :users, controllers: { registrations: 'users/registrations'}
    
  devise_scope :user do
     get '/sign_up', to: 'devise/registrations#new'
     get '/log_in',  to: 'devise/sessions#new'
     get '/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users, only: [:create, :show, :index] do
     member do
        get :following, :followers 
     end
     resources :beers, only: [:index] 
  end
  resources :beers 
  resources :relationships, only: [:create, :destroy]
    
end
