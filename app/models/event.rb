class Event < ActiveRecord::Base
  has_many :occurences
end
