class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :photo, presence: :true

  scope :persisted, -> { where.not(id: nil) }
end
