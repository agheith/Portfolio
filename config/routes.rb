Rails.application.routes.draw do

  devise_for :users
  resources :profiles, except: [:show]
  get 'profile/:id', to: 'profiles#show', as: 'profile_show'

  get 'about-me', to: 'pages#about'

  get 'contact-me', to: 'pages#contact'

  resources :blogs do
      member do
          get :toggle_status
      end
  end

  root to: 'pages#home'
end
