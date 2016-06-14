class Product < ActiveRecord::Base
	belongs_to :orders
	has_many :comments
end
