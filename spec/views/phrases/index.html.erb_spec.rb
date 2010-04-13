require 'spec_helper'

describe "/phrases/index.html.erb" do
  include PhrasesHelper

  before(:each) do
    assigns[:phrases] = [
      stub_model(Phrase,
        :phrase => "value for phrase",
        :definition => "value for definition",
        :universe_id => 1,
        :website => "value for website",
        :titleize => false
      ),
      stub_model(Phrase,
        :phrase => "value for phrase",
        :definition => "value for definition",
        :universe_id => 1,
        :website => "value for website",
        :titleize => false
      )
    ]
  end

  it "renders a list of phrases" do
    render
    response.should have_tag("tr>td", "value for phrase".to_s, 2)
    response.should have_tag("tr>td", "value for definition".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
