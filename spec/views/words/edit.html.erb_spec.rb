require 'spec_helper'

describe "/words/edit.html.erb" do
  include WordsHelper

  before(:each) do
    assigns[:word] = @word = stub_model(Word,
      :new_record? => false,
      :word => "value for word",
      :definition => "value for definition",
      :universe_id => 1,
      :website => "value for website",
      :is_name => false,
      :titleize => false
    )
  end

  it "renders the edit word form" do
    render

    response.should have_tag("form[action=#{word_path(@word)}][method=post]") do
      with_tag('input#word_word[name=?]', "word[word]")
      with_tag('input#word_definition[name=?]', "word[definition]")
      with_tag('input#word_universe_id[name=?]', "word[universe_id]")
      with_tag('input#word_website[name=?]', "word[website]")
      with_tag('input#word_is_name[name=?]', "word[is_name]")
      with_tag('input#word_titleize[name=?]', "word[titleize]")
    end
  end
end
