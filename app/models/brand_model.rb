class BrandModel < ActiveRecord::Base

  belongs_to :brand, inverse_of: :brand_models
  has_many :cars, inverse_of: :brand_model

  validates :name, presence: true, uniqueness: { :scope => :brand_id }
  validates :brand_id, presence: true

end
