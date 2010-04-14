require 'spec_helper'

describe "/managers/show.html.erb" do
  include ManagersHelper
  before(:each) do
    assigns[:manager] = @manager = stub_model(Manager,
      :name => "value for name",
      :website => "value for website"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ website/)
  end
end
