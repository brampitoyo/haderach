require 'spec_helper'

describe "/universes/show.html.erb" do
  include UniversesHelper
  before(:each) do
    assigns[:universe] = @universe = stub_model(Universe,
      :name => "value for name",
      :website => "value for website",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/value\ for\ description/)
  end
end
