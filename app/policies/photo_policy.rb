class PhotoPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_event_owner?(record) || user_photo_owner?(record)
  end

  private

  def user_event_owner?(comment)
    user.present? && photo&.event.user == user
  end

  def user_photo_owner?(commnet)
    user.present? && photo&.user == user
  end
end
