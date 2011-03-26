require 'spec_helper'

describe Donation do
  it 'should require first_name' do
    d = Donation.new
    d.save
    d.errors.on(:first_name).should be_present
  end
  it 'should require last_name' do
    d = Donation.new
    d.save
    d.errors.on(:last_name).should be_present
  end
  it 'should require email' do
    d = Donation.new
    d.save
    d.errors.on(:email).should be_present
  end
  it 'should require address' do
    d = Donation.new
    d.save
    d.errors.on(:address).should be_present
  end
  it 'should require city'
  it 'should require state'
  it 'should require zip'
  it 'should require amount'
end
