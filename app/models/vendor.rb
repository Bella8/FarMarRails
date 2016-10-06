class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products

  # def sales
  #   products = Vendor.products
  # end
end
