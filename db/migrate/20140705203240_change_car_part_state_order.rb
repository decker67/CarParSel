class ChangeCarPartStateOrder < ActiveRecord::Migration
  def change
    CarPart.where( ebay_state: 2 ).update_all( ebay_state: 20 )
    CarPart.where( ebay_state: 0 ).update_all( ebay_state: 2 )
    CarPart.where( ebay_state: 20 ).update_all( ebay_state: 0 )
  end

end
