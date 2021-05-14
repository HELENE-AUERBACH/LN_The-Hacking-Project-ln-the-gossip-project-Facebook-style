Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips do
    resources :comments, except: [:show]
  end
  resources :users do
    resources :private_messages, except: [:show]
  end
  resources :cities, only: [:show]
  resources :tags, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get 'welcome/:first_name', to: 'welcome#show'
  root 'gossips#index'
  get '/', to: 'gossips#index'
end
