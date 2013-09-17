class Ability
  include CanCan::Ability

  def initialize(current_user)
    
    if current_user.role == 'admin'
      can :manage, :all
    else
      #group permissions
      can [:read, :users, :links], Group, :memberships => { :user_id => current_user.id }
      can [:manage], Group, :memberships => { :user_id => current_user.id, :leader => "true" }
      
      #discussion permissions
      can :manage, Discussion, :user_id => current_user.id 
      can :read, Discussion, :group => {:memberships => { :user_id => current_user.id }}
      
      #article permissions
      can [:manage], Article, :user_id => current_user.id
      can :read, Article, :group => {:memberships => { :user_id => current_user.id }} 
      
    end
    
  end
end
