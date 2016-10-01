class AddthCategoryToCarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :th_category, :string
  end
end
