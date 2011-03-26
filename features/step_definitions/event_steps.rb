Given /a "(.*)" event exists/ do |name|
  @event = Event.create :name => name, :description => 'fun',
    :start_date => Date.tomorrow, :end_date => Date.tomorrow
end
