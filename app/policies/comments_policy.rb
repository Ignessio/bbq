class CommentsPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_is_owner?(record)
  end

  def user_is_owner?(comment)
    user.present? && comment&.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
