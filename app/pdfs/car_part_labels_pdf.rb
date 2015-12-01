class CarPartLabelsPdf

  require 'prawn/labels'
  require 'prawn/measurement_extensions'
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/prawn_outputter'

  Prawn::Labels.types = {
      "CarPartLabels" => {
          "paper_size"    => "A4",
          "top_margin"    => 7.mm,
          "left_margin"   => 2.mm,
          "columns"       => 3,
          "rows"          => 8,
          "column_gutter" => 14.mm,
          "row_gutter"    => 13.mm
      } }

  def initialize( car_parts )
    @car_parts = car_parts
  end

  def render
    Prawn::Labels.render( @car_parts,
                          type: "CarPartLabels",
                          "shrink_to_fit" => true ) do |pdf, car_part|
      #car_part.id = 12345678901234567890
      id = car_part.id.to_s.reverse.scan(/\d{1,3}/).join(" ").reverse
      barcode_text = 'P#' + car_part.id.to_s
      barcode = Barby::Code128B.new(barcode_text)
      outputter = Barby::PrawnOutputter.new(barcode)
      pdf.indent 15 do
        outputter.annotate_pdf(pdf)
        #pdf.print_qr_code(qrcode_text, :extent=>3.send(:cm), :stroke=>false, :level=>:h)
        pdf.text_box(id);#, :at => [100, 53], :width => 120, :size => 24)
      end
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
    return brand_name, model_name, model_type
  end


end