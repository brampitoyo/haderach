require 'spec_helper'

describe "/words/index.html.erb" do
  include WordsHelper

  before(:each) do
    assigns[:words] = [
      stub_model(Word,
        :word => "value for word",
        :definition => "value for definition",
        :universe_id => 1,
        :website => "value for website",
        :is_name => false,
        :titleize => false
      ),
      stub_model(Word,
        :word => "value for word",
        :definition => "value for definition",
        :universe_id => 1,
        :website => "value for website",
        :is_name => false,
        :titleize => false
      )
    ]
  end

  it "renders a list of words" do
    render
    response.should have_tag("tr>td", "value for word".to_s, 2)
    response.should have_tag("tr>td", "value for definition".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
