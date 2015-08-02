class AddStorageRefToCarPart < ActiveRecord::Migration
  def change
    add_reference :car_parts, :storage, index: true
  end
end
