Rails.application.routes.draw do

  resources :profiles, except: [:show]
  get 'profile/:id', to: 'profiles#show', as: 'profile_show'

  get 'about-me', to: 'pages#about'

  get 'contact-me', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
