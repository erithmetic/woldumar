require "spec_helper"

describe DonationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/donations" }.should route_to(:controller => "donations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/donations/new" }.should route_to(:controller => "donations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/donations/1" }.should route_to(:controller => "donations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/donations/1/edit" }.should route_to(:controller => "donations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/donations" }.should route_to(:controller => "donations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/donations/1" }.should route_to(:controller => "donations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/donations/1" }.should route_to(:controller => "donations", :action => "destroy", :id => "1")
    end

  end
end
