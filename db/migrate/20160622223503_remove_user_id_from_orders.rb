class RemoveUserIdFromOrders < ActiveRecord::Migration
  def change
  	remove_reference :orders, :user, index: true, foreign_key: true
  end
end
