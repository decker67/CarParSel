class ChangeAndAddImageUrls < ActiveRecord::Migration
  def change
    add_column :cars, :base_image_url, :string
    rename_column :cars, :picture_url, :image_file_name
    rename_column :cars, :ebayShopCategory, :ebay_shop_category
    rename_column :cars, :ebaySecondShopCategory, :ebay_second_shop_category
  end
end
