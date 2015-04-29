class AddCategory2CarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :ebay_shop_category, :string
  end
end
