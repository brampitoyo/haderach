require 'spec_helper'

describe "/universes/new.html.erb" do
  include UniversesHelper

  before(:each) do
    assigns[:universe] = stub_model(Universe,
      :new_record? => true,
      :name => "value for name",
      :website => "value for website",
      :description => "value for description"
    )
  end

  it "renders new universe form" do
    render

    response.should have_tag("form[action=?][method=post]", universes_path) do
      with_tag("input#universe_name[name=?]", "universe[name]")
      with_tag("input#universe_website[name=?]", "universe[website]")
      with_tag("textarea#universe_description[name=?]", "universe[description]")
    end
  end
end
