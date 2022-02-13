class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :body, presence: true

  def user_name
    if user.present?
      user_name
    else
      super
    end
  end
end
