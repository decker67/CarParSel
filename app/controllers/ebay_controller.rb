class EbayController < ApplicationController

  layout 'plain'

  def create
    @car_part = CarPart.find_by_id( params[:id] )
    @car = Car.find_by_id( @car_part.car_id );

    @back_to_url = params[ :from_url ]

    create_picture_urls
  end

  private

  def create_picture_urls
    @car_picture_url = @car.nil? ? nil : @car.picture_url

    if @car_picture_url.nil? || @car_picture_url == ''
      @car_picture_url = @car_part.picture_url1
      start_index = 2
    else
      start_index = 1
    end

    attribute_name_template = 'picture_url'
    @picture_parts_urls = []
    for i in start_index..6 do
      url = @car_part[attribute_name_template + i.to_s]
      @picture_parts_urls << url unless url.nil? || url == ''
    end
  end

end
