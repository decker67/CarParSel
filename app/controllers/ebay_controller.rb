class EbayController < ApplicationController

  layout 'plain'

  def create
    @car_part = CarPart.find_by_id( params[:id] )
    @car = Car.find_by_id( @car_part.car_id );

    @back_to_url = params[ :from_url ]

    create_picture_urls_array
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
