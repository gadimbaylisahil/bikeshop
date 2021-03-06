# Summarized order information
class Order < ActiveRecord::Base
	belongs_to :order_status
	has_many :order_items
	before_create :set_order_status
	before_save :update_total
	belongs_to :user

	def total
		order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
	end

	private

		def set_order_status
			self.order_status_id = 1 
		end

		def update_total
			self[:total] = total
		end
end

