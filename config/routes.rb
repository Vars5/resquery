Resquery::Application.routes.draw do
  
  root :to => 'staticpages#home'
  
  
  devise_for :users

  resources :groups
  resources :memberships, only: [:create, :update, :destroy]

end
