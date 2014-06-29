class AddQuantityToCarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :quantity, :integer
  end
end
