class Car < ActiveRecord::Base

  FUEL_TYPES = [ :Benzin, :Diesel ]
  GEARING_TYPES = [ :Automatik, :Schaltung ]

  belongs_to :seller



end
