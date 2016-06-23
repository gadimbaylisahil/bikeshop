class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true
	validates :image_url, presence: true
	
	has_many :comments
	has_many :order_items

	# Average rating for reviews of product
  def average_rating
  	comments.average(:rating).to_f
  end

  default_scope { where(active: true) }
end
