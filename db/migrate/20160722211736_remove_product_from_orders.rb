class RemoveProductFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :product, index: true, foreign_key: true
  end
end
