class CarPart < ActiveRecord::Base

  validate :description, presence: true, length: { maximum: 45 }
  validate :validate_ebay_online_since

  AUCTION_TYPES = [ [ 'Festpreis', 0 ], [ 'Auktion', 1 ] ]
  AUCTION_STATE = [ [ 'Online', 0 ], [ 'Vollständig', 1 ], [ 'In Bearbeitung', 2 ], [ 'Fertig', 3 ] ]

  belongs_to :car, inverse_of: :car_parts

  def ebay_selling_type_as_string
    return AUCTION_TYPES[ ebay_selling_type ][ 0 ]
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

  private
  def validate_ebay_online_since
    if ebay_state == 0 && !ebay_online_since?
      errors.add :ebay_online_since, 'Bitte erfassen Sie das Datum!'
    end
  end

end
