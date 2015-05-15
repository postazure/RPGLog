class PostSegment < ActiveRecord::Base
  belongs_to :post

  validates :subject, presence: true
end
