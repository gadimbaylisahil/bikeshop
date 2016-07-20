class Product < ActiveRecord::Base
	has_many :comments
	has_many :order_items

	validates :name, presence: true, length: { in: 6..30 }
	validates :price, presence: true
	validates :image_url, presence: true
	validates :decription, presence: true, length: { maximum: 500 }

	# Average rating for reviews of product
  	def average_rating
  		comments.average(:rating).to_f
  	end
end
