class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :name
      t.text :description
      t.string :value

      t.timestamps
    end

    Parameter.create name: 'PATH_TO_CAR_PICTURES',
                     value: 'http://autohalle24.de/ebay/ebay-artikelbilder/',
                     description: 'Basispfad zu Artikelbildern der Autos'
  end
end
