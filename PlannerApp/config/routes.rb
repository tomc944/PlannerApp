Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show, :index]
  resource :session, only: [:create, :destroy, :new]
  resources :goals, except: [:new, :index, :show]
end
