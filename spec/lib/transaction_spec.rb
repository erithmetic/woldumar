require 'spec_helper'
require 'transaction'

describe Transaction do
  describe '#initialize' do
    it 'assigns attributes according to provided parameters' do
      t = Transaction.new :cc_number => '1234', 
        :cc_expiration_year => '2012', :cc_expiration_month => '07',
        :cc_ccv => '123',
        :donation => {
          :first_name => 'Derek', 
          :last_name => 'Kastner',
          :amount => 123.5
        },
        :first_name => 'Derek', 
        :last_name => 'Kastner',
        :amount => 123.4

      t.cc_number.should == '1234'
      t.cc_expiration_year.should == '2012'
      t.cc_expiration_month.should == '07'
      t.cc_ccv.should == '123'
      t.amount.should == 123.4
      t.first_name.should == 'Derek'
      t.last_name.should == 'Kastner'
    end
  end

  describe '#post' do
    let(:transaction) do
      Transaction.new :cc_number => '1234', 
        :cc_expiration_year => '2012', :cc_expiration_month => '07',
        :cc_ccv => '123'
    end

    before :each do
      @card = mock(ActiveMerchant::Billing::CreditCard, :valid? => true)
      transaction.stub!(:credit_card).and_return(@card)
      @gateway_response = mock(Object, :success? => true, :authorization => 334455, :message => 'OK')
      @gateway = mock(ActiveMerchant::Billing::AuthorizeNetGateway, :authorize => @gateway_response, :capture => nil)
      transaction.stub!(:gateway).and_return(@gateway)
    end

    it 'returns the authorization number if transaction was successful' do
      transaction.post.should == 334455
    end
    it 'returns false if credit card is invalid' do
      @card.stub!(:valid?).and_return false
      transaction.post.should be_false
    end
    it 'returns false if credit card capture fails' do
      @gateway_response.stub!(:success?).and_return false
      transaction.post.should be_false
    end
    it 'stores the failure message' do
      @gateway_response.stub!(:success?).and_return false
      @gateway_response.stub!(:message).and_return 'I failed'
      transaction.post
      transaction.message.should == 'I failed'
    end
  end
end

