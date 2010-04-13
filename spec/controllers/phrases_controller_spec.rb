require 'spec_helper'

describe PhrasesController do

  def mock_phrase(stubs={})
    @mock_phrase ||= mock_model(Phrase, stubs)
  end

  describe "GET index" do
    it "assigns all phrases as @phrases" do
      Phrase.stub(:find).with(:all).and_return([mock_phrase])
      get :index
      assigns[:phrases].should == [mock_phrase]
    end
  end

  describe "GET show" do
    it "assigns the requested phrase as @phrase" do
      Phrase.stub(:find).with("37").and_return(mock_phrase)
      get :show, :id => "37"
      assigns[:phrase].should equal(mock_phrase)
    end
  end

  describe "GET new" do
    it "assigns a new phrase as @phrase" do
      Phrase.stub(:new).and_return(mock_phrase)
      get :new
      assigns[:phrase].should equal(mock_phrase)
    end
  end

  describe "GET edit" do
    it "assigns the requested phrase as @phrase" do
      Phrase.stub(:find).with("37").and_return(mock_phrase)
      get :edit, :id => "37"
      assigns[:phrase].should equal(mock_phrase)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created phrase as @phrase" do
        Phrase.stub(:new).with({'these' => 'params'}).and_return(mock_phrase(:save => true))
        post :create, :phrase => {:these => 'params'}
        assigns[:phrase].should equal(mock_phrase)
      end

      it "redirects to the created phrase" do
        Phrase.stub(:new).and_return(mock_phrase(:save => true))
        post :create, :phrase => {}
        response.should redirect_to(phrase_url(mock_phrase))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved phrase as @phrase" do
        Phrase.stub(:new).with({'these' => 'params'}).and_return(mock_phrase(:save => false))
        post :create, :phrase => {:these => 'params'}
        assigns[:phrase].should equal(mock_phrase)
      end

      it "re-renders the 'new' template" do
        Phrase.stub(:new).and_return(mock_phrase(:save => false))
        post :create, :phrase => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested phrase" do
        Phrase.should_receive(:find).with("37").and_return(mock_phrase)
        mock_phrase.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :phrase => {:these => 'params'}
      end

      it "assigns the requested phrase as @phrase" do
        Phrase.stub(:find).and_return(mock_phrase(:update_attributes => true))
        put :update, :id => "1"
        assigns[:phrase].should equal(mock_phrase)
      end

      it "redirects to the phrase" do
        Phrase.stub(:find).and_return(mock_phrase(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(phrase_url(mock_phrase))
      end
    end

    describe "with invalid params" do
      it "updates the requested phrase" do
        Phrase.should_receive(:find).with("37").and_return(mock_phrase)
        mock_phrase.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :phrase => {:these => 'params'}
      end

      it "assigns the phrase as @phrase" do
        Phrase.stub(:find).and_return(mock_phrase(:update_attributes => false))
        put :update, :id => "1"
        assigns[:phrase].should equal(mock_phrase)
      end

      it "re-renders the 'edit' template" do
        Phrase.stub(:find).and_return(mock_phrase(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested phrase" do
      Phrase.should_receive(:find).with("37").and_return(mock_phrase)
      mock_phrase.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the phrases list" do
      Phrase.stub(:find).and_return(mock_phrase(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(phrases_url)
    end
  end

end
