class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    can :read, Blog # All users can read (view) blogs

    if user.persisted? # Only apply to authenticated users
      can :create, Blog
      can [:update, :destroy], Blog, user_id: user.id
    end
  end
end
