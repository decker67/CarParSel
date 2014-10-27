class AddStockCodeToCarParts < ActiveRecord::Migration

  def change
    add_column :car_parts, :stock, :string
  end

end
