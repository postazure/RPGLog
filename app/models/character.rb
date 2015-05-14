class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :name, :race, :money, :exp, :level, presence: true
  validates :name, uniqueness: {scope: :group_id}
end
