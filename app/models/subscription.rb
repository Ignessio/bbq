class Subscription < ApplicationRecord
  EMAIL_FORMAT = /\A\w+@\w+\.\w+\z/

  belongs_to :event
  belongs_to :user, optional: true

  before_validation :event_owner

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  validates :user_name, presence: true, unless: -> { user.present? }

  validates :user_email,
          presence: true,
          uniqueness: { scope: :event_id },
          format: { with: EMAIL_FORMAT },
          unless: -> { user.present? }

  def event_owner
    errors if event.user == user
  end

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end
end
