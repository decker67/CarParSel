class AddSecondPrice < ActiveRecord::Migration
  def change
    add_column :car_parts, :second_price, :decimal, precision: 18, scale: 2
  end
end
