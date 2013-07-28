Resquery::Application.routes.draw do
  

  root :to => 'dashboards#dashboard', :constraints => lambda {|r| r.env["warden"].authenticate? }
  root :to => 'staticpages#home'


  match '/about', :to => 'staticpages#about'
  
  devise_for :users

  resources :groups
  resources :memberships, only: [:create, :update, :destroy]

end
