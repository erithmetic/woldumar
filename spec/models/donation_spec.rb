require 'spec_helper'

describe Donation do
  let(:user) { User.create! :first_name => 'foo', :last_name => 'bar', :email => 'granny@smith.com',
                            :password => 'ohjoys', :password_confirmation => 'ohjoys' }
  let(:donation) {
    Donation.new(:user => user, :credit_card => { :number => '1234'})
  }

  describe '#transaction' do
    it 'is initialized with credit card info' do
      donation.transaction.first_name.should == 'foo'
      donation.transaction.last_name.should == 'bar'
      donation.transaction.number.should == '1234'
    end
  end

  describe '#save' do
    it 'assigns cc_auth to the transaction result' do
      mock_transaction = mock(Transaction, :post => 14, :message => nil)
      donation.stub!(:transaction).and_return mock_transaction
      donation.save.should be_true
      donation.cc_auth.should == 14
    end
    it 'returns false if transaction is invalid' do
      mock_transaction = mock(Transaction, :post => false, :message => 'arg')
      donation.stub!(:transaction).and_return mock_transaction
      donation.save
      donation.cc_auth.should be_nil
    end
  end
end
