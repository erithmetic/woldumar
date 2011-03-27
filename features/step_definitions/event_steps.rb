Given /a "(.*)" event exists/ do |name|
  @event = Event.create :name => name, :description => 'fun',
    :start_date => Date.tomorrow, :end_date => Date.tomorrow,
    :event_tickets => [
      EventTicket.new(:name => 'Adult', :price => 15.00),
      EventTicket.new(:name => 'Student', :price => 13.00),
      EventTicket.new(:name => 'Child under 12', :price => 10.00)
    ]
end
