class Seller < ActiveRecord::Base

  has_many :cars, inverse_of: :seller, dependent: :nullify

  validates :first_name, :last_name, :street, :city, :phone, presence: true
  validates :first_name, :uniqueness => { :scope => :last_name }

end
