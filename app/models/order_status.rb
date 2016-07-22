# Status of an order / in progress/ completed/ ..etc
class OrderStatus < ActiveRecord::Base
	before_filter :authenticate_user!
	has_many :orders
end
