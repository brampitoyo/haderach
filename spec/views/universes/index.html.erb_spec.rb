require 'spec_helper'

describe "/universes/index.html.erb" do
  include UniversesHelper

  before(:each) do
    assigns[:universes] = [
      stub_model(Universe,
        :name => "value for name",
        :website => "value for website",
        :description => "value for description"
      ),
      stub_model(Universe,
        :name => "value for name",
        :website => "value for website",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of universes" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
