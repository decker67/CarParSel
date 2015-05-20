module ApplicationHelper

  def base_picture_url(car)
    car.base_image_url || Parameter.find_by_name('PATH_TO_CAR_PICTURES').value
  end

  def create_picture_urls(car, car_part, base_url)
    car_picture_url = car.nil? ? nil : prepend_picture_url( base_url, car.image_file_name)

    # use first car part picture, if car picture is empty
    if car_picture_url.nil? || car_picture_url == base_url
      car_picture_url = prepend_picture_url( base_url, car_part.picture_url1)
      start_index = 2
    else
      start_index = 1
    end

    attribute_name_template = 'picture_url'
    picture_parts_urls = []
    for i in start_index..6 do
      picture_url = car_part[attribute_name_template + i.to_s]
      url = prepend_picture_url( base_url, picture_url)
      picture_parts_urls << url unless picture_url.nil? || picture_url == ''
    end

    return car_picture_url, picture_parts_urls
  end

  def prepend_picture_url(base_url, picture_url)
    return picture_url.start_with?('http://') ? picture_url : base_url + picture_url;
  end

end
