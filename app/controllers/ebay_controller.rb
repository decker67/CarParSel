class EbayController < ApplicationController

  include ApplicationHelper

  layout 'plain'

  def create(car_part_id = nil)
    @car_part = CarPart.find_by_id(car_part_id || params[:id] )
    @car = Car.find_by_id( @car_part.car_id );

    @back_to_url = car_part_id.nil? ? params[ :from_url ] : ''
    @car_picture_url, @picture_parts_urls = create_picture_urls(@car, @car_part, base_picture_url(@car))

    render action: CarPart::EBAY_TEMPLATES[session[:template].to_i][0]
  end

  def euraf

  end

  def autohalle

  end

end
