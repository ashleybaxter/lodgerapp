class Ability
	include CanCan::Ability
  
	def initialize(user)
		can :manage, Property, :user_id => user.id
		can :manage, Tenant
	end
end