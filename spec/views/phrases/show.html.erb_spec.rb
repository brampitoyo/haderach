require 'spec_helper'

describe "/phrases/show.html.erb" do
  include PhrasesHelper
  before(:each) do
    assigns[:phrase] = @phrase = stub_model(Phrase,
      :phrase => "value for phrase",
      :definition => "value for definition",
      :universe_id => 1,
      :website => "value for website",
      :titleize => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ phrase/)
    response.should have_text(/value\ for\ definition/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/false/)
  end
end
