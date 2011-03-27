require 'spec_helper'
require 'transaction'

describe EventRegistration do
  let(:user) { User.create! :first_name => 'foo', :last_name => 'bar', :email => 'granny@smith.com',
                            :password => 'ohjoys', :password_confirmation => 'ohjoys' }
  let(:event) { Event.create! :name => 'Fooble' }
  let(:event_registration) {
    EventRegistration.new(:user => user, :event => event,
                          :credit_card => {
                            :number => '1234'})
  }

  it 'validates at least one ticket is purchased' do
    e = Event.new :name => 'test'
    e.should_not be_valid
    e.errors.on(:event_tickets).should be_present
  end

  describe '#transaction' do
    it 'is initialized with credit card info' do
      event_registration.transaction.first_name.should == 'foo'
      event_registration.transaction.last_name.should == 'bar'
      event_registration.transaction.number.should == '1234'
    end
  end

  describe '#save' do
    it 'assigns cc_auth to the transaction result' do
      mock_transaction = mock(Transaction, :post => 14, :message => nil)
      event_registration.stub!(:transaction).and_return mock_transaction
      event_registration.save.should be_true
      event_registration.cc_auth.should == 14
    end
    it 'returns false if transaction is invalid' do
      mock_transaction = mock(Transaction, :post => false, :message => 'arg')
      event_registration.stub!(:transaction).and_return mock_transaction
      event_registration.save
      event_registration.cc_auth.should be_nil
    end
  end
end
