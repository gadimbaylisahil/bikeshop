class RenameDescriptionInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :decription, :description
  end
end
