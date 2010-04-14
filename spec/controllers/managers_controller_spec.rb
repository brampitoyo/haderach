require 'spec_helper'

describe ManagersController do

  def mock_manager(stubs={})
    @mock_manager ||= mock_model(Manager, stubs)
  end

  describe "GET index" do
    it "assigns all managers as @managers" do
      Manager.stub(:find).with(:all).and_return([mock_manager])
      get :index
      assigns[:managers].should == [mock_manager]
    end
  end

  describe "GET show" do
    it "assigns the requested manager as @manager" do
      Manager.stub(:find).with("37").and_return(mock_manager)
      get :show, :id => "37"
      assigns[:manager].should equal(mock_manager)
    end
  end

  describe "GET new" do
    it "assigns a new manager as @manager" do
      Manager.stub(:new).and_return(mock_manager)
      get :new
      assigns[:manager].should equal(mock_manager)
    end
  end

  describe "GET edit" do
    it "assigns the requested manager as @manager" do
      Manager.stub(:find).with("37").and_return(mock_manager)
      get :edit, :id => "37"
      assigns[:manager].should equal(mock_manager)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created manager as @manager" do
        Manager.stub(:new).with({'these' => 'params'}).and_return(mock_manager(:save => true))
        post :create, :manager => {:these => 'params'}
        assigns[:manager].should equal(mock_manager)
      end

      it "redirects to the created manager" do
        Manager.stub(:new).and_return(mock_manager(:save => true))
        post :create, :manager => {}
        response.should redirect_to(manager_url(mock_manager))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved manager as @manager" do
        Manager.stub(:new).with({'these' => 'params'}).and_return(mock_manager(:save => false))
        post :create, :manager => {:these => 'params'}
        assigns[:manager].should equal(mock_manager)
      end

      it "re-renders the 'new' template" do
        Manager.stub(:new).and_return(mock_manager(:save => false))
        post :create, :manager => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested manager" do
        Manager.should_receive(:find).with("37").and_return(mock_manager)
        mock_manager.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :manager => {:these => 'params'}
      end

      it "assigns the requested manager as @manager" do
        Manager.stub(:find).and_return(mock_manager(:update_attributes => true))
        put :update, :id => "1"
        assigns[:manager].should equal(mock_manager)
      end

      it "redirects to the manager" do
        Manager.stub(:find).and_return(mock_manager(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(manager_url(mock_manager))
      end
    end

    describe "with invalid params" do
      it "updates the requested manager" do
        Manager.should_receive(:find).with("37").and_return(mock_manager)
        mock_manager.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :manager => {:these => 'params'}
      end

      it "assigns the manager as @manager" do
        Manager.stub(:find).and_return(mock_manager(:update_attributes => false))
        put :update, :id => "1"
        assigns[:manager].should equal(mock_manager)
      end

      it "re-renders the 'edit' template" do
        Manager.stub(:find).and_return(mock_manager(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested manager" do
      Manager.should_receive(:find).with("37").and_return(mock_manager)
      mock_manager.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the managers list" do
      Manager.stub(:find).and_return(mock_manager(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(managers_url)
    end
  end

end
