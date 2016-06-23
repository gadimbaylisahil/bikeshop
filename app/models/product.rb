class Product < ActiveRecord::Base
	has_many :comments
	has_many :order_items

	validates :name, presence: true
	validates :price, presence: true
	validates :image_url, presence: true

	# Average rating for reviews of product
  def average_rating
  	comments.average(:rating).to_f
  end

  # default_scope { where(active: true) }
end
