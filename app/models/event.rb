class Event < ActiveRecord::Base
  has_many :event_registrations
  has_many :event_tickets

  accepts_nested_attributes_for :event_tickets

  validates_presence_of :name
  validates_length_of :event_tickets, :minimum => 1

  scope :upcoming, :conditions => ['end_date >= ?', Time.now]

  has_attached_file :flier

  def start_date
    @start_date = read_attribute(:start_date)
    if (@start_date)
      @start_date = @start_date.localtime
    end
  end

  def end_date
    @end_date = read_attribute(:end_date)
    if (@end_date)
      @end_date = @end_date.localtime
    end
  end
end
