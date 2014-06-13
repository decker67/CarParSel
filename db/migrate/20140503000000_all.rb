class All < ActiveRecord::Migration
  def change

    create_table :brands do |t|
      t.string :name
      t.timestamps
    end
    add_index :brands, :name, unique: true

    create_table :brand_models do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
    add_index :brand_models, [ :name, :brand_id ], unique: true

    create_table :model_types do |t|
      t.integer :brand_model_id
      t.string :model_type
      t.integer :month_of_construction_period_from
      t.integer :year_of_construction_period_from
      t.integer :month_of_construction_period_to
      t.integer :year_of_construction_period_to

      t.timestamps
    end
    add_index :model_types, [ :model_type, :brand_model_id ], unique: true

    create_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :phone

      t.timestamps
    end

    create_table :cars do |t|
      t.string :car_identifier
      t.string :car_brand_id
      t.string :engine_code
      t.string :gearing_code
      t.string :color_code
      t.integer :model_type_id
      t.integer :price
      t.integer :power
      t.date :date_of_construction
      t.integer :cylinder_capacity
      t.integer :fuel
      t.integer :gearing
      t.string  :key_number2
      t.string  :key_number3
      t.integer :mileage
      t.integer :seller_id
      t.string :picture_url
      t.string :ebay_url_all_parts
      t.text :name_ebay_url_all_parts

      t.timestamps
    end
    add_index :cars, :car_identifier, unique: true
    add_index :cars, :model_type_id

    create_table :car_parts do |t|
      t.integer :car_id
      t.text :part_number
      t.text :description

      t.string :ebay_article_number
      t.integer :ebay_selling_type
      t.date :ebay_online_since
      t.integer :ebay_state
      t.decimal :price, precision: 18, scale: 2
      t.decimal :postage_germany, precision: 18, scale: 2
      t.decimal :postage_austria, precision: 18, scale: 2
      t.decimal :postage_swiss, precision: 18, scale: 2
      t.decimal :postage_europe_with_eu, precision: 18, scale: 2
      t.decimal :postage_europe_without_eu, precision: 18, scale: 2
      t.decimal :postage_world_wide, precision: 18, scale: 2
      t.string :picture_url1
      t.string :picture_url2
      t.string :picture_url3
      t.string :picture_url4
      t.string :picture_url5
      t.string :picture_url6
      t.text :remark

      t.timestamps
    end
    add_index :car_parts, :car_id
    add_index :car_parts, :ebay_article_number

  end
end