Rails.application.routes.draw do
  
  root 'static_pages#home'

  get '/contact', to: 'static_pages#contact'

  get '/about',   to: 'static_pages#about'

  devise_for :users, controllers: { registrations: 'users/registrations'}
    
  devise_scope :user do
     get '/sign_up', to: 'devise/registrations#new'
     get '/log_in',  to: 'devise/sessions#new'
  end

  resources :users, only: [:create, :show]
    
end
