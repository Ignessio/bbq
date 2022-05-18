class Subscription < ApplicationRecord
  EMAIL_FORMAT = /\A\w+@\w+\.\w+\z/

  belongs_to :event
  belongs_to :user, optional: true

  validate :event_host, if: -> { user.present? }

  validate :email_used, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  validates :user_name, presence: true, unless: -> { user.present? }

  validates :user_email,
          presence: true,
          uniqueness: { scope: :event_id },
          format: { with: EMAIL_FORMAT },
          unless: -> { user.present? }

  def event_host
    errors.add(:user, :not_allowed) if event.user == user
  end

  def email_used
    errors.add(:user_email, :email_used) if User.find_by(email: user_email)
  end

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end
end
