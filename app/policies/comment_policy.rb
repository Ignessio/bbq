class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user_event_owner?(record) || user_comment_owner?(record)
  end

  private

  def user_event_owner?(comment)
    user.present? && comment&.event.user == user
  end

  def user_comment_owner?(commnet)
    user.present? && comment&.user == user
  end
end
