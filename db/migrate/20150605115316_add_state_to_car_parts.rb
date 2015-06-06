class AddStateToCarParts < ActiveRecord::Migration
  def change
    add_column :car_parts, :state, :integer
    CarPart.update_all(state: 3000) #set state to 3000 for all existing entries (Gebraucht)
  end
end
