module CarPartsHelper

  def absolute_picture_url(car, picture_url)
    prepend_picture_url(base_picture_url(car), picture_url)
  end

end
