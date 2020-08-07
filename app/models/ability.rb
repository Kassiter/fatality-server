# frozen_string_literal: true

class Ability
  #connects_to database: { writing: :primary, reading: :primary }

  include CanCan::Ability
  def initialize(user)
    can :read, :all                 # allow everyone to read everything
    return unless user && user.admin?

    # can :access, :rails_admin       # only allow admin users to access Rails Admin
    # can :read, :dashboard           # allow access to dashboard
    if user.moder&.main?
      
      #can :read, :dashboard 
      
      can :manage, ManageCommand
      can :manage, ManageCommandCategory
      can :access, :rails_admin
      cannot :manage, PrevilegiesKey
      cannot :manage, User
      cannot :manage, Contest
      cannot :manage, ContestKey
      cannot :manage, ContestsUser
      cannot :manage, Log
      cannot :manage, Moder
      cannot :manage, ModerContest
      cannot :manage, ModerContestsUser
      cannot :manage, PersonalFeature
      cannot :manage, PersonalItem
      cannot :manage, Priviliege
      cannot :manage, PriviliegesFeature
      cannot :manage, Refund
      cannot :manage, VipUser
    end

    if user.cto
      
      #can :read, :dashboard 
      
      can :manage, ManageCommand
      can :manage, ManageCommandCategory
      can :access, :rails_admin
      cannot :manage, PrevilegiesKey
      cannot :manage, User
      can :manage, Contest
      cannot :manage, ContestKey
      can :manage, ContestsUser
      cannot :manage, Log
      can :manage, Moder
      can :manage, ModerContest
      can :manage, ModerContestsUser
      can :manage, PersonalFeature
      can :manage, PersonalItem
      can :manage, Priviliege
      can :manage, PriviliegesFeature
      cannot :manage, Refund
      cannot :manage, VipUser
    end

    if user.superadmin?
      can :manage, :all
      # can :manage, :personal_feature
      # can :manage, :contest
      # can :manage, :contests_user
      # can :manage, :priviliege
      # can :manage, :privilieges_feature
      # can :manage, :user
      # can :manage, :moder_contests_user
      # can :manage, :moder_contest
      can :read, :dashboard   
    end        # allow superadmins to do anything

    # elsif user.role? :manager
    #   can :manage, [User, Product]  # allow managers to do anything to products and users
    # elsif user.role? :sales
    #   can :update, Product, hidden: false  # allow sales to only update visible products
    # end
  end
end
