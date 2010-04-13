require 'spec_helper'

describe "/words/show.html.erb" do
  include WordsHelper
  before(:each) do
    assigns[:word] = @word = stub_model(Word,
      :word => "value for word",
      :definition => "value for definition",
      :universe_id => 1,
      :website => "value for website",
      :is_name => false,
      :titleize => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ word/)
    response.should have_text(/value\ for\ definition/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/false/)
    response.should have_text(/false/)
  end
end
