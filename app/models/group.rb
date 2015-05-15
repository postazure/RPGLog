class Group < ActiveRecord::Base
  has_many :players
  has_many :group_invites
  belongs_to :user

  validates :name, presence: true
end
