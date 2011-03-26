require 'spec_helper'

describe "donations/index.html.erb" do
  before(:each) do
    assign(:donations, [
      stub_model(Donation,
        :in_memory_of => "In Memory Of",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :phone => "Phone",
        :amount => "9.99",
        :cc_auth => 1
      ),
      stub_model(Donation,
        :in_memory_of => "In Memory Of",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :phone => "Phone",
        :amount => "9.99",
        :cc_auth => 1
      )
    ])
  end

  it "renders a list of donations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "In Memory Of".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
