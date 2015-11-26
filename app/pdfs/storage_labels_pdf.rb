class StorageLabelsPdf

  require 'prawn/labels'
  require 'prawn/measurement_extensions'
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/prawn_outputter'


  Prawn::Labels.types = {
      "StorageLabels" => {
          "paper_size"    => "A4",
          "top_margin"    => 7.mm,
          "left_margin"   => 2.mm,
          "columns"       => 3,
          "rows"          => 8,
          "column_gutter" => 14.mm,
          "row_gutter"    => 13.mm
      } }

  def initialize( storages )
    @storages = storages
  end

  def render
    Prawn::Labels.render( @storages,
                          type: "StorageLabels",
                          "shrink_to_fit" => true ) do |pdf, storage|

      barcode_text = 'S#' + storage.id.to_s
      barcode = Barby::Code128B.new(barcode_text)
      outputter = Barby::PrawnOutputter.new(barcode)
      pdf.indent 0 do #15 do
        outputter.annotate_pdf(pdf)
        pdf.text_box(storage.name, :at => [100, 53], :width => 120, :size => 16)
      end
    end
  end


end