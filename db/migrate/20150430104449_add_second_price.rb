class AddSecondPrice < ActiveRecord::Migration
  def change
    add_column :car_parts, :second_price, :number, precision: 18, scale: 2
  end
end
