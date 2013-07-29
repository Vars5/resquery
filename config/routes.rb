Resquery::Application.routes.draw do
  
  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'

  match '/about', :to => 'staticpages#about'
  match '/test', :to => 'dashboards#test_group'
  
  devise_for :users

  resources :groups do 
    resources :discussions
  end
  
  resources :memberships, only: [:create, :update, :destroy]
  #resources :discussions
  resources :comments, only: [:create, :destroy]

end
