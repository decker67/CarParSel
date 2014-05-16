class CarPart < ActiveRecord::Base

  validate :description, presence: true, length: { maximum: 45 }

  AUCTION_TYPES = [ [ 'Festpreis', 0 ], [ 'Auktion', 1 ] ]
  AUCTION_STATE = [ [ 'Online', 0 ], [ 'Offline', 1 ] ]

  has_one :car, inverse_of: :car_parts

end
