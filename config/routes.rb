Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:show, :index] do
    resources :dogs, only: [:new, :create, :show]
  end

  resources :dogs, only: [:show] do
    resources :toys, only: [:create]
    resources :appointments, only: [:create]
  end
end
