require 'spec_helper'

describe PhrasesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/phrases" }.should route_to(:controller => "phrases", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/phrases/new" }.should route_to(:controller => "phrases", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/phrases/1" }.should route_to(:controller => "phrases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/phrases/1/edit" }.should route_to(:controller => "phrases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/phrases" }.should route_to(:controller => "phrases", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/phrases/1" }.should route_to(:controller => "phrases", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/phrases/1" }.should route_to(:controller => "phrases", :action => "destroy", :id => "1") 
    end
  end
end
