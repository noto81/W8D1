Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :show, :edit, :update]
  resources :subs, only: [:new, :create, :show, :edit, :update, :index]
end
 