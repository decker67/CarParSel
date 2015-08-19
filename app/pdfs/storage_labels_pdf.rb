class StorageLabelsPdf

  require 'prawn/labels'
  require 'prawn/measurement_extensions'
  require 'prawn/qrcode'

  Prawn::Labels.types = {
      "StorageLabels" => {
          "paper_size"    => "A4",
          "top_margin"    => 1.2.cm,
          "left_margin"   => 0,
          "columns"       => 3,
          "rows"          => 8,
          "column_gutter" => 12.mm,
          "row_gutter"    => 9.mm
      } }

  def initialize( storages )
    @storages = storages
  end

  def render
    Prawn::Labels.render( @storages,
                          type: "StorageLabels",
                          "shrink_to_fit" => true ) do |pdf, storage|

      qrcode_text = 'S#' + storage.id.to_s
      pdf.indent 0 do #15 do
        pdf.print_qr_code(qrcode_text, :extent=>3.send(:cm), :stroke=>false, :level=>:h)
        pdf.text_box(storage.name, :at => [80, 60], :width => 120, :size => 16)
      end
    end
  end


end