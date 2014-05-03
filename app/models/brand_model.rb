class BrandModel < ActiveRecord::Base

  validates :name, :brand_id, presence: true

end
