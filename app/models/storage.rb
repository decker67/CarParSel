class Storage < ActiveRecord::Base

  has_many :car_parts, inverse_of: :storage, dependent: :nullify
  validates :name, presence: true, uniqueness: true

end
