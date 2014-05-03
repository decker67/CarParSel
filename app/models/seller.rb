class Seller < ActiveRecord::Base

  has_many :cars

  validates :firstName, :lastName, :street, :city, :phone, presence: true
  validates :firstName, :uniqueness => { :scope => :lastName }

end
