class PostSegment < ActiveRecord::Base
  belongs_to :Post

  validates :subject, presence: true
end
