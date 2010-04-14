require 'spec_helper'

describe "/managers/index.html.erb" do
  include ManagersHelper

  before(:each) do
    assigns[:managers] = [
      stub_model(Manager,
        :name => "value for name",
        :website => "value for website"
      ),
      stub_model(Manager,
        :name => "value for name",
        :website => "value for website"
      )
    ]
  end

  it "renders a list of managers" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
  end
end
