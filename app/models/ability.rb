class Ability
  include CanCan::Ability

  def initialize(current_user)
    
    if current_user.role == 'admin'
      can :manage, :all
    else
      can :read, Group, :memberships => { :user_id => current_user.id }
      can :manage, Discussion, :user_id => current_user.id 
      can :read, Discussion, :group => {:memberships => { :user_id => current_user.id }}
    end
    
  end
end
