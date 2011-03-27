class Event < ActiveRecord::Base
  has_many :event_registrations

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
