class Seller < ActiveRecord::Base

  has_many :cars

  validates :first_name, :last_name, :street, :city, :phone, presence: true
  validates :first_name, :uniqueness => { :scope => :last_name }

end
