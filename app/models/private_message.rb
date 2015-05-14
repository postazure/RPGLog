class PrivateMessage < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: {with: true, message: "Recipient's Account not found"}
  validates :subject, presence: true
end
