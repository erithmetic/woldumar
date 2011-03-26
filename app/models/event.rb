class Event < ActiveRecord::Base
  scope :upcoming, :conditions => ['end_date >= ?', Time.now]

  has_attached_file :flier
end
