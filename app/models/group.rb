class Group < ActiveRecord::Base
  belongs_to :member
  has_many :memberships, dependent: :destroy
  has_many :members_joined, through: :memberships, source: :member
  validates :name, :description, presence: true
  validates :name, length: {minimum:5}
  validates :description, length: {minimum:11}
end
