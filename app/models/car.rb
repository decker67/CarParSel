class Car < ActiveRecord::Base


  FUEL_TYPES = [ :Benzin, :Diesel ]
  GEARING_TYPES = [ :Automatik, :Schaltung ]

  belongs_to :seller, inverse_of: :cars
  has_many :car_parts, inverse_of: :car
  belongs_to :brand_model, inverse_of: :cars

end
