class Product < ActiveRecord::Base
  has_many :orders, :through => :productorders
end
