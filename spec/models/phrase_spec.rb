require 'spec_helper'

describe Phrase do
  before(:each) do
    @valid_attributes = {
      :phrase => "value for phrase",
      :definition => "value for definition",
      :universe_id => 1,
      :website => "value for website",
      :titleize => false
    }
  end

  it "should create a new instance given valid attributes" do
    Phrase.create!(@valid_attributes)
  end
end
