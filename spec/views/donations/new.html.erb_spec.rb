require 'spec_helper'

describe "donations/new.html.erb" do
  before(:each) do
    assign(:donation, stub_model(Donation,
      :in_memory_of => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :phone => "MyString",
      :amount => "9.99",
      :cc_auth => 1
    ).as_new_record)
  end

  it "renders new donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => donations_path, :method => "post" do
      assert_select "input#donation_in_memory_of", :name => "donation[in_memory_of]"
      assert_select "input#donation_first_name", :name => "donation[first_name]"
      assert_select "input#donation_last_name", :name => "donation[last_name]"
      assert_select "input#donation_email", :name => "donation[email]"
      assert_select "input#donation_address", :name => "donation[address]"
      assert_select "input#donation_city", :name => "donation[city]"
      assert_select "input#donation_state", :name => "donation[state]"
      assert_select "input#donation_zip", :name => "donation[zip]"
      assert_select "input#donation_phone", :name => "donation[phone]"
      assert_select "input#donation_amount", :name => "donation[amount]"
      assert_select "input#donation_cc_auth", :name => "donation[cc_auth]"
    end
  end
end
