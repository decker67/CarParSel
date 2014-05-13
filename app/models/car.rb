class Car < ActiveRecord::Base

  FUEL_TYPES = [ [ 'Benzin', 0 ], [ 'Diesel', 1 ] ]
  GEARING_TYPES = [ [ 'Automatik', 0 ], [ 'Schaltung', 1 ] ]

  belongs_to :seller, inverse_of: :cars
  has_many :car_parts, inverse_of: :car
  belongs_to :brand_model, inverse_of: :cars

  def ps
    return CarsHelper.power_to_ps( self.power )
  end

  def ps=( value )
    self.power = CarsHelper.ps_to_power( value )
  end

end
