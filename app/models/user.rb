class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  # has_one :avatar, class_name: 'Photo', dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  after_commit :link_subscriptions, on: :create

  validates :name, presence: true, length: { maximum: 35 }

  # accepts_nested_attributes_for :avatar

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end
end
