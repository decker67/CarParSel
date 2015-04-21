class EbayController < ApplicationController

  layout 'plain'

  def create
    @car_part = CarPart.find_by_id( params[:id] )
    @car = Car.find_by_id( @car_part.car_id );

    @back_to_url = params[ :from_url ]

    base_picture_url = @car.base_image_url || Parameter.find_by_name('PATH_TO_CAR_PICTURES').value
    create_picture_urls(base_picture_url)
  end

  private

  def create_picture_urls(base_url)
    @car_picture_url = @car.nil? ? nil : @car.image_file_name

    # use first car part picture, if car picture is empty
    if @car_picture_url.nil? || @car_picture_url == ''
      @car_picture_url = prepend_picture_url( base_url, @car_part.picture_url1)
      start_index = 2
    else
      start_index = 1
    end

    attribute_name_template = 'picture_url'
    @picture_parts_urls = []
    for i in start_index..6 do
      picture_url = @car_part[attribute_name_template + i.to_s]
      url = prepend_picture_url( base_url, picture_url)
      @picture_parts_urls << url unless picture_url.nil? || picture_url == ''
    end
  end

  def prepend_picture_url(base_url, picture_url)
    return picture_url.start_with?('http://') ? picture_url : base_url + picture_url;
  end

end
