class GroupInvite < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: {with: true, message: "Recipient's Account not found"}
end
