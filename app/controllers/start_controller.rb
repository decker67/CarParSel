class StartController < ApplicationController

  def overview
    @car_parts = CarPart.where( ebay_state: 1 )
  end

end
