class ModelType < ActiveRecord::Base

  belongs_to :brand_model, inverse_of: :model_types
  has_many :cars, inverse_of: :model_type, dependent: :nullify

  validates :model_type, presence: true, uniqueness: {:scope => :brand_model_id}
  validates :brand_model_id, presence: true
  validates :month_of_construction_period_from, presence: true
  validates :year_of_construction_period_from, presence: true

  validate :construction_period_to

  private
  def construction_period_to
    period_to_given = month_of_construction_period_to && year_of_construction_period_to

    if period_to_given
      months_from = month_of_construction_period_from + year_of_construction_period_from*12
      months_to = month_of_construction_period_to + year_of_construction_period_to*12
      if months_to < months_from
        errors.add( 'Herstellungszeitraum', 'Das Ende des Herstellungszeitraums muss hinter dem Anfang liegen.' )
      end
    end
  end

end
