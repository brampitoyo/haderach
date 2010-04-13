require 'spec_helper'

describe LinkWord do
  before(:each) do
    @valid_attributes = {
      :link_id => 1,
      :word_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    LinkWord.create!(@valid_attributes)
  end
end
