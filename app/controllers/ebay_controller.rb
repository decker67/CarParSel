class EbayController < ApplicationController

  include ApplicationHelper

  layout 'plain'

  def create
    @car_part = CarPart.find_by_id( params[:id] )
    @car = Car.find_by_id( @car_part.car_id );

    @back_to_url = params[ :from_url ]

    @car_picture_url, @picture_parts_urls = create_picture_urls(@car, @car_part, base_picture_url(@car))
  end


end
