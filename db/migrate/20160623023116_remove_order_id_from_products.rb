class RemoveOrderIdFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :order_id
  end
end
