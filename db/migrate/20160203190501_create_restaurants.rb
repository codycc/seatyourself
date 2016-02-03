class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.string :photo

      t.timestamps null: false
    end
  end
end
