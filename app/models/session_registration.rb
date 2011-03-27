class SessionRegistration < ActiveRecord::Base
  belongs_to :user
  has_many :children
  
  accepts_nested_attributes_for :children
end
