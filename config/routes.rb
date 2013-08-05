Resquery::Application.routes.draw do
  
  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'

  match '/about', :to => 'staticpages#about'
  match '/test', :to => 'dashboards#test_group'
  match '/admin', to: 'dashboards#admin'
  
  get '/groups/:id/users', to: 'groups#users', as: 'users_group'
  
  devise_for :users

  resources :groups do 
    resources :discussions
  end
  
  resources :memberships, only: [:create, :update, :destroy]
  #resources :discussions
  resources :comments, only: [:create, :destroy]
  resources :links, only: [:create, :destroy]
  
  resources :notifications do
    member do
      get :deactivate
    end
  end
end
