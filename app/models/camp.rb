require 'chronic'

class ::Fixnum
  def to_ordinal
    if (10..20) === self
      "#{self}th"
    else
      suffixes = %w( th st nd rd th th th th th th )
      "#{self}#{suffixes[self.to_s[-1].to_i]}"
    end
  end
end

class Camp < ActiveRecord::Base
  has_many :sessions
  
  before_save :parse_times

  money_column :fee
  money_column :discount

  def parse_times
    start_time = Chronic.parse(start_time) if start_time
    end_time = Chronic.parse(end_time) if end_time
  end

  def format_time(time)
    time.strftime "%B #{time.strftime("%d").to_i.to_ordinal}, %Y, #{time.strftime("%I").to_i}:%M%p"
  end

  def formatted_start_time
    format_time start_time
  end
  def formatted_end_time
    format_time end_time
  end
end
