class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    update?
  end
  
  def show?
    update?
  end
  
  def update?
    user_is_owner?(record)
  end
  
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  def user_is_owner?(event)
    user.present? && event&.user == user
  end  
end
