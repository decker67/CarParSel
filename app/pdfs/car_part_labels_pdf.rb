class CarPartLabelsPdf

  require 'prawn/labels'
  require 'prawn/measurement_extensions'

  Prawn::Labels.types = {
      "CarPartLabels" => {
          "paper_size"    => "A4",
          "top_margin"    => 1.2.cm,
          "left_margin"   => 0,
          "columns"       => 3,
          "rows"          => 8,
          "column_gutter" => 12.mm,
          "row_gutter"    => 9.mm
      } }

  def initialize( car_parts )
    @car_parts = car_parts
  end

  def render
    Prawn::Labels.render( @car_parts,
                          type: "CarPartLabels",
                          "shrink_to_fit" => true ) do |pdf, car_part|
      pdf.text Prawn::Text::NBSP*4 + car_part.id.to_s, style: :bold, size: 12
      pdf.text Prawn::Text::NBSP*5 + car_part.car.car_identifier, size: 10
      pdf.text Prawn::Text::NBSP*7 + car_part.part_number, size: 6
      pdf.text Prawn::Text::NBSP*5 + name_of_car( car_part ), size: 10
    end
  end

  private

  def name_of_car( car_part )
    model_type = '?'
    model_name = '?'
    brand_name = '?'
    if !car_part.car.nil?
      if !car_part.car.model_type.nil?
        model_type = car_part.car.model_type.model_type
        if !car_part.car.model_type.brand_model.nil?
          model_name = car_part.car.model_type.brand_model.name
          if !car_part.car.model_type.brand_model.brand.nil?
            brand_name = car_part.car.model_type.brand_model.brand.name
          end
        end
      end
    end
    brand_name + ' ' + model_name + ' ' + model_type
  end


end