require 'chronic'
class Event < ActiveRecord::Base
  has_many :event_registrations
  has_many :event_tickets

  validates_presence_of :name
  validates_length_of :event_tickets, :minimum => 1

  scope :upcoming, :conditions => ['end_date >= ?', Time.now]

  has_attached_file :flier
  
  before_save :parse_times
  
  def parse_times
    start_date = Chronic.parse(start_date) if start_date
    end_date = Chronic.parse(end_date) if end_date
  end
end
