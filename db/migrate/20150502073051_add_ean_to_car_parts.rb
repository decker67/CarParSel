class AddEanToCarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :ean, :string
  end
end
