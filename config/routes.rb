Rails.application.routes.draw do

  resources :profiles

  get 'about-me', to: 'pages#about'

  get 'contact-me', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
