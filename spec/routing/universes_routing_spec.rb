require 'spec_helper'

describe UniversesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/universes" }.should route_to(:controller => "universes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/universes/new" }.should route_to(:controller => "universes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/universes/1" }.should route_to(:controller => "universes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/universes/1/edit" }.should route_to(:controller => "universes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/universes" }.should route_to(:controller => "universes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/universes/1" }.should route_to(:controller => "universes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/universes/1" }.should route_to(:controller => "universes", :action => "destroy", :id => "1") 
    end
  end
end
