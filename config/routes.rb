Rails.application.routes.draw do
  resources :restaurants, only: [:index, :new, :show, :create] do
    resources :reviews, only: [:create]
  end
  root 'restaurants#index'
end
