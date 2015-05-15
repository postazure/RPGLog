class Group < ActiveRecord::Base
  has_many :players
  has_many :group_invites
  has_many :posts
  belongs_to :user

  validates :name, presence: true
end
