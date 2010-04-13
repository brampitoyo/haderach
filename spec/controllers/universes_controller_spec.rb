require 'spec_helper'

describe UniversesController do

  def mock_universe(stubs={})
    @mock_universe ||= mock_model(Universe, stubs)
  end

  describe "GET index" do
    it "assigns all universes as @universes" do
      Universe.stub(:find).with(:all).and_return([mock_universe])
      get :index
      assigns[:universes].should == [mock_universe]
    end
  end

  describe "GET show" do
    it "assigns the requested universe as @universe" do
      Universe.stub(:find).with("37").and_return(mock_universe)
      get :show, :id => "37"
      assigns[:universe].should equal(mock_universe)
    end
  end

  describe "GET new" do
    it "assigns a new universe as @universe" do
      Universe.stub(:new).and_return(mock_universe)
      get :new
      assigns[:universe].should equal(mock_universe)
    end
  end

  describe "GET edit" do
    it "assigns the requested universe as @universe" do
      Universe.stub(:find).with("37").and_return(mock_universe)
      get :edit, :id => "37"
      assigns[:universe].should equal(mock_universe)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created universe as @universe" do
        Universe.stub(:new).with({'these' => 'params'}).and_return(mock_universe(:save => true))
        post :create, :universe => {:these => 'params'}
        assigns[:universe].should equal(mock_universe)
      end

      it "redirects to the created universe" do
        Universe.stub(:new).and_return(mock_universe(:save => true))
        post :create, :universe => {}
        response.should redirect_to(universe_url(mock_universe))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved universe as @universe" do
        Universe.stub(:new).with({'these' => 'params'}).and_return(mock_universe(:save => false))
        post :create, :universe => {:these => 'params'}
        assigns[:universe].should equal(mock_universe)
      end

      it "re-renders the 'new' template" do
        Universe.stub(:new).and_return(mock_universe(:save => false))
        post :create, :universe => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested universe" do
        Universe.should_receive(:find).with("37").and_return(mock_universe)
        mock_universe.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :universe => {:these => 'params'}
      end

      it "assigns the requested universe as @universe" do
        Universe.stub(:find).and_return(mock_universe(:update_attributes => true))
        put :update, :id => "1"
        assigns[:universe].should equal(mock_universe)
      end

      it "redirects to the universe" do
        Universe.stub(:find).and_return(mock_universe(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(universe_url(mock_universe))
      end
    end

    describe "with invalid params" do
      it "updates the requested universe" do
        Universe.should_receive(:find).with("37").and_return(mock_universe)
        mock_universe.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :universe => {:these => 'params'}
      end

      it "assigns the universe as @universe" do
        Universe.stub(:find).and_return(mock_universe(:update_attributes => false))
        put :update, :id => "1"
        assigns[:universe].should equal(mock_universe)
      end

      it "re-renders the 'edit' template" do
        Universe.stub(:find).and_return(mock_universe(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested universe" do
      Universe.should_receive(:find).with("37").and_return(mock_universe)
      mock_universe.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the universes list" do
      Universe.stub(:find).and_return(mock_universe(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(universes_url)
    end
  end

end
