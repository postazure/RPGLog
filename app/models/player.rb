class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :name, uniqueness: {scope: :group_id}
end
