class AddPostageToCarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :postage_id, :integer
  end
end
