class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy

  before_validation :set_name, on: :create

  validates :name, presence: true, length: { maximum: 35 }

  private
  def set_name
    self.name = "User#{rand(999)}" if self.name.blank?
  end
end
