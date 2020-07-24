# frozen_string_literal: true

class Ability
#  connects_to database: { writing: :primary, reading: :primary }

  include CanCan::Ability
  def initialize(user)
    can :read, :all                 # allow everyone to read everything
    return unless user && user.admin?
    # can :access, :rails_admin       # only allow admin users to access Rails Admin
    # can :read, :dashboard           # allow access to dashboard
    
    if user.superadmin?
      can :manage, :all
      can :read, :dashboard   
    end        # allow superadmins to do anything
    # elsif user.role? :manager
    #   can :manage, [User, Product]  # allow managers to do anything to products and users
    # elsif user.role? :sales
    #   can :update, Product, hidden: false  # allow sales to only update visible products
    # end
  end
end
