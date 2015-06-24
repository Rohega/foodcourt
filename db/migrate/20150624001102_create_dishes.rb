class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.attachment :photo
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
