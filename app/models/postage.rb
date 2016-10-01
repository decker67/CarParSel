class Postage < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :car_parts, inverse_of: :postage, dependent: :nullify

end
