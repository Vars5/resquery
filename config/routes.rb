Resquery::Application.routes.draw do
  devise_for :users

  resources :groups
  resources :memberships, only: [:create, :update, :destroy]

end
