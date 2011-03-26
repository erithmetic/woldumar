require 'chronic'
class Camp < ActiveRecord::Base
  has_many :sessions
  
  before_save :parse_times
  
  def parse_times
    start_time = Chronic.parse(start_time) if start_time
    end_time = Chronic.parse(end_time) if end_time
  end
end
