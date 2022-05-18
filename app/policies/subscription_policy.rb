class SubscriptionPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_event_owner?(record) || user_subscription_owner?(record)
  end

  private

  def user_event_owner?(subscription)
    user.present? && (subscription.try(:event).try(:user) == user)
  end

  def user_subscription_owner?(subscription)
    user.present? && (subscription.try(:user) == user)
  end
end
