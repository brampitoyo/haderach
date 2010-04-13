require 'spec_helper'

describe "/phrases/edit.html.erb" do
  include PhrasesHelper

  before(:each) do
    assigns[:phrase] = @phrase = stub_model(Phrase,
      :new_record? => false,
      :phrase => "value for phrase",
      :definition => "value for definition",
      :universe_id => 1,
      :website => "value for website",
      :titleize => false
    )
  end

  it "renders the edit phrase form" do
    render

    response.should have_tag("form[action=#{phrase_path(@phrase)}][method=post]") do
      with_tag('input#phrase_phrase[name=?]', "phrase[phrase]")
      with_tag('input#phrase_definition[name=?]', "phrase[definition]")
      with_tag('input#phrase_universe_id[name=?]', "phrase[universe_id]")
      with_tag('input#phrase_website[name=?]', "phrase[website]")
      with_tag('input#phrase_titleize[name=?]', "phrase[titleize]")
    end
  end
end
