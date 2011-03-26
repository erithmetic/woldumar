require "spec_helper"

describe EventRegistrationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/event_registrations" }.should route_to(:controller => "event_registrations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/event_registrations/new" }.should route_to(:controller => "event_registrations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/event_registrations/1" }.should route_to(:controller => "event_registrations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/event_registrations/1/edit" }.should route_to(:controller => "event_registrations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/event_registrations" }.should route_to(:controller => "event_registrations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/event_registrations/1" }.should route_to(:controller => "event_registrations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/event_registrations/1" }.should route_to(:controller => "event_registrations", :action => "destroy", :id => "1")
    end

  end
end
