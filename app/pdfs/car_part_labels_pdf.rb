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
      id = car_part.id.to_s.reverse.scan(/\d{1,3}/).join(" ").reverse
      barcode_text = 'P#' + car_part.id.to_s
      barcode = Barby::Code128B.new(barcode_text)
      outputter = Barby::PrawnOutputter.new(barcode)
      pdf.indent 15 do
        outputter.annotate_pdf(pdf)
        pdf.text_box(id)
      end
    end
  end

end