class Product < ActiveRecord::Base
	belongs_to :orders
	has_many :comments

	# Average rating for reviews of product
  def average_rating
   	comments.average(:rating).to_f
  end
end
