class Brand < ActiveRecord::Base


  has_many :brand_models, inverse_of: :brand, dependent: :nullify

  validates :name, presence: true, uniqueness: true

end
