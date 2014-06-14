class ModelType < ActiveRecord::Base

  belongs_to :brand_model, inverse_of: :model_types
  has_many :cars, inverse_of: :model_type

  validates :model_type, presence: true, uniqueness: {:scope => :brand_model_id}
  validates :brand_model_id, presence: true
  validates :month_of_construction_period_from, presence: true
  validates :year_of_construction_period_from, presence: true
  #validates :month_of_construction_period_to, presence: true
  #validates :year_of_construction_period_to, presence: true

end
