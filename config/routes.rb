Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trucks, only: [:index, :show, :new, :create, :edit, :update] do
    resources :rents, only: %i[new create]
  end
  resources :rents, only: %i[index], as: 'my_rentals'
  resources :trucks, only: %i[destroy], as: 'delete_truck'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
