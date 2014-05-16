class EbayController < ApplicationController

  def create
    logger.debug "params" + params.inspect
    @car_part = CarPart.find_by_id( params[:id] )
    @car = Car.find_by_id( @car_part.car_id );

    create_picture_urls_array

    @disable_car_data = @disable_car_data || false
  end

  private
  def create_picture_urls_array
    attribute_name_template = 'picture_url'
    @picture_urls = []
    for i in 1..6 do
      url = @car_part[attribute_name_template + i.to_s]
      @picture_urls << url unless url.nil? || url == ''
    end
  end

end
