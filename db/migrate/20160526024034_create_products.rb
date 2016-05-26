class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :decription
      t.string :image_url
      t.boolean :brand_new
      t.integer :price

      t.timestamps null: false
    end
  end
end
