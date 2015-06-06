# encoding: utf-8

module CarPartsHelper

  def absolute_picture_url(car, picture_url)
    prepend_picture_url(base_picture_url(car), picture_url)
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
    details.join(',')
  end


  private

  def create_csv_details_from( field_name, field_value)
    if !field_value.nil? && field_value != ''
      field_name + ':' + field_value
    end
  end

end
