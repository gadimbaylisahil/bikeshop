class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true
	validates :image_url, presence: true
	
	belongs_to :orders
	has_many :comments

	# Average rating for reviews of product
  def average_rating
  	comments.average(:rating).to_f
  end
end
