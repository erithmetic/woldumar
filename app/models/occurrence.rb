class Occurrence < ActiveRecord::Base
  validates_numericality_of :price
  validate :price, :presence => true
  validate :details, :presence => true
  validate :start_date, :presence => true
  validate :end_date, :presence => true
end
