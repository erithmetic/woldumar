class Child < ActiveRecord::Base
  belongs_to :session_registration
  has_many :session_child_registrations
  
  accepts_nested_attributes_for :session_child_registrations
end
