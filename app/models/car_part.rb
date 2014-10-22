class CarPart < ActiveRecord::Base

  validate :description, presence: true, length: { maximum: 45 }
  #validate :validate_ebay_online_since

  AUCTION_TYPES = [ [ 'Festpreis', 0 ], [ 'Auktion', 1 ] ]
  AUCTION_STATE = [ [ 'In Bearbeitung', 0 ], [ 'Bereit fuer ebay', 1 ], [ 'FVL fehlt', 2 ], [ 'Fertig', 3 ], [ 'Verkauft', 4 ] ]

  belongs_to :car, inverse_of: :car_parts

  def formatted_id
    id_as_string = id.to_s
    '0' * (6 - id_as_string.length) + id_as_string
  end

  def ebay_selling_type_as_string
    AUCTION_TYPES[ ebay_selling_type ][ 0 ]
  end

  def state_as_string
    AUCTION_STATE[ ebay_state ][ 0 ]
  end

  def toggle_state
    self.ebay_state = ( ebay_state == 4 ) ? 0 : ( ebay_state + 1 )
  end

  def is_auction?
    ebay_selling_type == 1
  end

  def no_postage_for_germany?
    postage_germany.to_f == 0.0
  end

  def remark_given?
    remark != ''
  end

  def part_number_with_commas
    adjusted_part_numbers = part_number

    if !adjusted_part_numbers.include?( ',' )
      adjusted_part_numbers.gsub!( ' ', ', ' )
    end
    return adjusted_part_numbers
  end

  private
  #def validate_ebay_online_since
  #  if ebay_state == 3 && !ebay_online_since?
  #    errors.add :ebay_online_since, 'Bitte erfassen Sie das Datum!'
  #  end
  #end

end
