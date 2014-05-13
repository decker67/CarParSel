module CarsHelper

  def self.ps_to_power( ps )
    return  ps / 1.35962
  end

  def self.power_to_ps( power )
    return  power * 1.35962
  end

end
