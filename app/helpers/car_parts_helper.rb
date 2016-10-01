# encoding: utf-8

module CarPartsHelper

  def absolute_picture_url(car, picture_url)
    prepend_picture_url(base_picture_url(car), picture_url)
  end

  def create_cvs_line(car_part)
    html = render :text => renderActionInOtherController(
                      EbayController,
                      :create,{ id: car_part, dont_show_generator_controls: true})

    [car_part.formatted_id,
     car_part.storage_id.nil? ? 'unbekannt' : car_part.storage.name,
     car_part.description,
     car_part.price,
     car_part.quantity,
     car_part.postage_id, #?
     car_part.car_id.nil? ? car_part.picture_url1 : car_part.car.base_image_url + car_part.picture_url1,
     car_part.car_id.nil? ? car_part.picture_url2 : car_part.car.base_image_url + car_part.picture_url2,
     car_part.car_id.nil? ? car_part.picture_url3 : car_part.car.base_image_url + car_part.picture_url3,
     car_part.car_id.nil? ? car_part.picture_url4 : car_part.car.base_image_url + car_part.picture_url4,
     car_part.car_id.nil? ? car_part.picture_url5 : car_part.car.base_image_url + car_part.picture_url5,
     car_part.car_id.nil? ? car_part.picture_url6 : car_part.car.base_image_url + car_part.picture_url6,
     car_part.ebay_shop_category,
     car_part.car_id.nil? ? '' : car_part.car.ebay_shop_category,
     car_part.car_id.nil? ? '' : car_part.car.ebay_second_shop_category,
     'Teilenummern:' + (car_part.part_number.nil? ? '' : car_part.part_number), #Teilenummern: 1234, 1234,
     car_part.car_id.nil? || !car_part.show_car_details ? '' : create_car_details(car_part.car),
     html,
     car_part.description,
     car_part.remark,
     car_part.price,
     Date.current,
     (car_part.ebay_state == 1) ? 'ja' : 'nein',
     (car_part.ebay_state == 3) ? 'ja' : 'nein',
     car_part.state,
     'EUR',
     'EUR',
     '19',
     'DE',
     car_part.car_id.nil? ? '' : car_part.car.key_number2.to_s + car_part.car.key_number3.to_s,
     car_part.postage_id.nil? ? '' : (['VKK7', 'VKK8', 'VKK9'].include? car_part.postage.name) ? '2' : '1',
     car_part.th_category
    ]
  end

  def create_car_details(car)
    details = [
        (car.model_type.nil? || car.model_type.brand_model.nil? || car.model_type.brand_model.brand.nil?) ? '' : create_csv_details_from('Marke', car.model_type.brand_model.brand.name),
        (car.model_type.nil? || car.model_type.brand_model.nil?) ? '' : create_csv_details_from('Modell', car.model_type.brand_model.name),
        car.model_type.nil? ? '' : create_csv_details_from('Typ', car.model_type.model_type),
        create_csv_details_from('Fahrzeug-Id', car.car_brand_id),
        create_csv_details_from('Motor-Code', car.engine_code),
        create_csv_details_from('Getriebe-Code', car.gearing_code),
        create_csv_details_from('Farb-Code', car.color_code),
        create_csv_details_from('Leistung', car.power.to_s + ' kW / ' + car.ps.round.to_s + ' PS'),
        create_csv_details_from('Baujahr', I18n.l(car.date_of_construction)),
        car.model_type.nil? ? '' : create_csv_details_from('Bauzeitraum', car.model_type.month_of_construction_period_from.to_s + '/' + car.model_type.year_of_construction_period_from.to_s + ' - ' + car.model_type.month_of_construction_period_to.to_s + '/' + car.model_type.year_of_construction_period_to.to_s),
        create_csv_details_from('Hubraum', car.cylinder_capacity.to_s + ' cm3'),
        create_csv_details_from('Kraftstoff', car.fuel_as_string),
        create_csv_details_from('Getriebeart', car.gearing_as_string),
        create_csv_details_from('Schlüsselnummer zu 2/3', car.key_number2 + '/' + car.key_number3),
        create_csv_details_from('Laufleistung', car.mileage.to_s + ' km')
    ]
    details.join(';')
  end


  private

  def create_csv_details_from( field_name, field_value)
    if !field_value.nil? && field_value != ''
      field_name + ':' + field_value
    end
  end

  def renderActionInOtherController(controller,action,params)
    c = controller.new
    c.params = params
    c.dispatch(action, request)
    c.response.body
  end

end
