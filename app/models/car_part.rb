class CarPart < ActiveRecord::Base

  validate :description, presence: true, length: { maximum: 45 }

  AUCTION_TYPES = [ [ 'Festpreis', 0 ], [ 'Auktion', 1 ] ]
  AUCTION_STATE = [ [ 'Online', 0 ], [ 'Offline', 1 ] ]

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

end
