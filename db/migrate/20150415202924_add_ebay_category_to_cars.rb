class AddEbayCategoryToCars < ActiveRecord::Migration
  def change
    add_column :cars, :ebayShopCategory, :string
    add_column :cars, :ebaySecondShopCategory, :string
  end
end
