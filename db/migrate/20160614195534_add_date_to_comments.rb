class AddDateToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :comment_date, :datetime
  end
end
