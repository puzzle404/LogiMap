class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.string :brand
      t.integer :model
      t.text :description
      t.integer :capacity
      t.integer :price

      t.timestamps
    end
  end
end
