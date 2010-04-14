require 'spec_helper'

describe "/managers/new.html.erb" do
  include ManagersHelper

  before(:each) do
    assigns[:manager] = stub_model(Manager,
      :new_record? => true,
      :name => "value for name",
      :website => "value for website"
    )
  end

  it "renders new manager form" do
    render

    response.should have_tag("form[action=?][method=post]", managers_path) do
      with_tag("input#manager_name[name=?]", "manager[name]")
      with_tag("input#manager_website[name=?]", "manager[website]")
    end
  end
end
