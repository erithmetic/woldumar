require 'spec_helper'

describe Event do
  it 'has associated EventTickets' do
    e = Event.new :name => 'test',
      :event_tickets => [
        EventTicket.new(:name => 'Adult', :price => 15.00),
        EventTicket.new(:name => 'Adult', :price => 15.00),
        EventTicket.new(:name => 'Student', :price => 13.00),
        EventTicket.new(:name => 'Child under 12', :price => 10.00)
      ]
    e.save
    e.event_tickets.length.should == 4
  end
  it 'validates at least one ticket is assigned' do
    e = Event.new :name => 'test'
    e.should_not be_valid
    e.errors.on(:event_tickets).should be_present
  end
end

