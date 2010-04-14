require 'spec_helper'

describe "/managers/edit.html.erb" do
  include ManagersHelper

  before(:each) do
    assigns[:manager] = @manager = stub_model(Manager,
      :new_record? => false,
      :name => "value for name",
      :website => "value for website"
    )
  end

  it "renders the edit manager form" do
    render

    response.should have_tag("form[action=#{manager_path(@manager)}][method=post]") do
      with_tag('input#manager_name[name=?]', "manager[name]")
      with_tag('input#manager_website[name=?]', "manager[website]")
    end
  end
end
