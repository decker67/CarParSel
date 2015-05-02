class AddFlagsToCarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :show_car_details, :integer
    add_column :car_parts, :show_car_overview, :integer
  end
end
