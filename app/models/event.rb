class Event < ActiveRecord::Base
  has_many :occurrences
end
