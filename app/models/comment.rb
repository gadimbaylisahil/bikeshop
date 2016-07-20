class Comment < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 40, too_long: "40 characters is the maximum allowed" }
  validates :body, presence: true, length: { maximum: 400, too_long: "400 characters is the maximum allowed" }
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1 }	 
  
  belongs_to :user
  belongs_to :product, dependent: :destroy
end
