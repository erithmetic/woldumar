require 'chronic'
class Session < ActiveRecord::Base
  belongs_to :camp
  
  before_save :parse_times
  
  def parse_times
    start_date = Chronic.parse(start_date) if start_date
    end_date = Chronic.parse(end_date) if end_date
  end
end
