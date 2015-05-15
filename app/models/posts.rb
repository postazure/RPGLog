class Posts < ActiveRecord::Base
  has_many :post_segments

  validates :title, presence: true
end
