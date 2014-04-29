class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :firstName
      t.string :lastName
      t.string :street
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
