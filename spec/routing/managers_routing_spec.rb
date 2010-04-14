require 'spec_helper'

describe ManagersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/managers" }.should route_to(:controller => "managers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/managers/new" }.should route_to(:controller => "managers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/managers/1" }.should route_to(:controller => "managers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/managers/1/edit" }.should route_to(:controller => "managers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/managers" }.should route_to(:controller => "managers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/managers/1" }.should route_to(:controller => "managers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/managers/1" }.should route_to(:controller => "managers", :action => "destroy", :id => "1") 
    end
  end
end
