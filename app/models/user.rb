class User < ApplicationRecord
  EMAIL_FORMAT = /\A\w+@\w+\.\w+\z/

  has_many :events, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }
  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 255 },
    format: { with: EMAIL_FORMAT }
end
