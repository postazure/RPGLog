class Post < ActiveRecord::Base
  has_many :post_segments
  belongs_to :group

  validates :title, presence: true
end
