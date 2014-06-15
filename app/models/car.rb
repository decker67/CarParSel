class Car < ActiveRecord::Base

  FUEL_TYPES = [ [ 'Benzin', 0 ], [ 'Diesel', 1 ] ]
  GEARING_TYPES = [ [ 'Automatik', 0 ], [ 'Schaltung', 1 ] ]

  belongs_to :seller, inverse_of: :cars
  has_many :car_parts, inverse_of: :car
  belongs_to :model_type, inverse_of: :cars

  validate :validate_date_of_construction

  def gearing_as_string
    return GEARING_TYPES[ gearing ][ 0 ]
  end

  def fuel_as_string
    return FUEL_TYPES[ fuel ][ 0 ]
  end

  def ps
    return CarsHelper.power_to_ps( self.power )
  end

  def ps=( value )
    self.power = CarsHelper.ps_to_power( value )
  end

  private
  def validate_date_of_construction
    if( !date_of_construction )
      errors.add( :date_of_construction, 'Bitte erfassen Sie ein Herstellungsdatum.' )
    end
  end
end
