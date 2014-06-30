class CreatePostages < ActiveRecord::Migration
  def change
    create_table :postages do |t|
      t.string :name
      t.decimal :postage_germany, precision: 18, scale: 2
      t.decimal :postage_austria, precision: 18, scale: 2
      t.decimal :postage_swiss, precision: 18, scale: 2
      t.decimal :postage_europe_with_eu, precision: 18, scale: 2
      t.decimal :postage_europe_without_eu, precision: 18, scale: 2
      t.decimal :postage_world_wide, precision: 18, scale: 2

      t.timestamps
    end
  end
end
