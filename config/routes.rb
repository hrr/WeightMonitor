Rails.application.routes.draw do
  root 'users#index'
  resources :weights, only: [:create, :destroy, :update]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
