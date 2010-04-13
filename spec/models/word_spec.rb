require 'spec_helper'

describe Word do
  before(:each) do
    @valid_attributes = {
      :word => "value for word",
      :definition => "value for definition",
      :universe_id => 1,
      :website => "value for website",
      :is_name => false,
      :titleize => false
    }
  end

  it "should create a new instance given valid attributes" do
    Word.create!(@valid_attributes)
  end
end
