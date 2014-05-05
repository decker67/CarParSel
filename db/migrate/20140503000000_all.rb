class All < ActiveRecord::Migration
  def change

    create_table :brands do |t|
      t.string :name

      t.timestamps
    end

    create_table :brand_models do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end

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
      t.integer :brand_model_id
      t.string :car_type
      t.integer :power
      t.integer :year_of_construction
      t.integer :construction_period_from
      t.integer :construction_period_to
      t.integer :cylinder_capacity
      t.integer :fuel
      t.integer :gearing
      t.string  :key_number2
      t.string  :key_number3
      t.integer :mileage
      t.integer :seller_id
      t.string :picture_url

      t.timestamps
    end

    create_table :car_parts do |t|
      t.integer :car_id
      t.text :description
      t.string :ebay_article_number
      t.integer :ebay_selling_type
      t.decimal :price
      t.decimal :postage_germany
      t.decimal :postage_austria
      t.decimal :postage_swiss
      t.decimal :postage_europe_with_eu
      t.decimal :postage_europe_without_eu
      t.decimal :postage_world_wide
      t.string :picture_url1
      t.string :picture_url2
      t.string :picture_url3
      t.string :picture_url4
      t.string :picture_url5
      t.string :picture_url6

      t.timestamps
    end


  end
end