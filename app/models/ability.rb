class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role == "admin"
        can :access, :rails_admin
        can :dashboard
        can :manage, :all
    elsif user.role == "editor"
        can :manage, Image
        can :manage, @image
        can :manage, Dataset
        can :manage, @dataset
    else
        can :read, Image
        can :read, Dataset
    end
  end
end
