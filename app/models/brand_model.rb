class BrandModel < ActiveRecord::Base

  belongs_to :brand, inverse_of: :brand_models
  has_many :model_types, inverse_of: :brand_model, dependent: :nullify

  validates :name, presence: true, uniqueness: { :scope => :brand_id }
  validates :brand_id, presence: true


end
