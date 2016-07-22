class FixColumnsInOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :product_id
  	add_column :orders, :order_status_id, :integer
  end
end
