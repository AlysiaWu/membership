class Member < ActiveRecord::Base
  has_secure_password
  has_many :groups 
  has_many :memberships ,dependent: :destroy
  has_many :groups_joined, through: :memberships, source: :group
   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, presence: true
end
