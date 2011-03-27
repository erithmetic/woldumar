class Product < ActiveRecord::Base
  has_many :orders, :through => :productorders

  has_attached_file :product_image
end
