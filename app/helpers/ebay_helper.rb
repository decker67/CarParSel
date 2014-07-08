module EbayHelper

  def create_details_from( field_name, field_value )
    if !field_value.nil? && field_value != ''
      row = '<tr>' +
              '<td>' + field_name + '</td>' +
              '<td>' + field_value + '</td>'
            '</tr>'
      return row.html_safe
    end
  end

  def postage_output( postage_value )
    if postage_value.nil?
      'auf Anfrage'
    elsif postage_value == 0
      'kostenlos'
    else
       number_to_currency postage_value
    end
  end

end