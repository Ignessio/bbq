class PhotoPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_event_owner?(record) || user_photo_owner?(record)
  end

  private

  def user_event_owner?(photo)
    user.present? && (photo.try(:event).try(:user) == user)
  end

  def user_photo_owner?(photo)
    user.present? && (photo.try(:user) == user)
  end
end
