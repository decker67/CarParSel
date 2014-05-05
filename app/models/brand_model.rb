class BrandModel < ActiveRecord::Base

  belongs_to :brand, inverse_of: :brand_models
  has_many :cars, inverse_of: :brand_model

  validates :name, :brand_id, presence: true

end
