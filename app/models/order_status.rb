# Status of an order / in progress/ completed/ ..etc
class OrderStatus < ActiveRecord::Base
	has_many :orders
end
