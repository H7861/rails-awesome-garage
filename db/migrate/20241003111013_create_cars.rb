class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.integer :year
      t.string :model
      t.string :fuel
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
