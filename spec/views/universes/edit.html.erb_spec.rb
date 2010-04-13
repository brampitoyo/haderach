require 'spec_helper'

describe "/universes/edit.html.erb" do
  include UniversesHelper

  before(:each) do
    assigns[:universe] = @universe = stub_model(Universe,
      :new_record? => false,
      :name => "value for name",
      :website => "value for website",
      :description => "value for description"
    )
  end

  it "renders the edit universe form" do
    render

    response.should have_tag("form[action=#{universe_path(@universe)}][method=post]") do
      with_tag('input#universe_name[name=?]', "universe[name]")
      with_tag('input#universe_website[name=?]', "universe[website]")
      with_tag('textarea#universe_description[name=?]', "universe[description]")
    end
  end
end
