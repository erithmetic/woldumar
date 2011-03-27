Given /^my credit card is valid$/ do
  @transaction = mock(Transaction, :post => 1234, :message => nil)
  Transaction.stub!(:new).and_return(@transaction)
end
Given /^my credit card is invalid$/ do
  @transaction = mock(Transaction, :post => false, :message => 'I failed')
  Transaction.stub!(:new).and_return(@transaction)
end
