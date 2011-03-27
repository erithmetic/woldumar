require 'chronic'
class Session < ActiveRecord::Base
  belongs_to :camp
  has_many :session_child_registrations
  has_many :children, :through => :session_child_registrations
  
  before_save :parse_times
  
  def parse_times
    start_date = Chronic.parse(start_date) if start_date
    end_date = Chronic.parse(end_date) if end_date
  end
end
