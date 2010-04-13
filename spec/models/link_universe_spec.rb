require 'spec_helper'

describe LinkUniverse do
  before(:each) do
    @valid_attributes = {
      :link_id => 1,
      :universe_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    LinkUniverse.create!(@valid_attributes)
  end
end
