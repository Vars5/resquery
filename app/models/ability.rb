class Ability
  include CanCan::Ability

  def initialize(current_user)
    
    if current_user.role == 'admin'
      can :manage, :all
    else
    end
  
  
  end
end
