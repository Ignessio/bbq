class Subscription < ApplicationRecord
  EMAIL_FORMAT = /\A\w+@\w+\.\w+\z/

  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  validates :user_email,
          presence: true,
          uniqueness: { scope: :event_id },
          format: { with: EMAIL_FORMAT },
          unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end
end
