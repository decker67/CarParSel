class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :carId
      t.integer :brand
      t.string :model
      t.string :type
      t.string :power
      t.string :yearOfConstruction
      t.string :integer
      t.string :constructionPeriod
      t.integer :cylinderCapacity
      t.integer :fuel
      t.integer :gearing
      t.string :keyNumber2
      t.string :keyNumber3
      t.integer :mileage

      t.timestamps
    end
  end
end
