require 'spec_helper'

describe Universe do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :website => "value for website",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Universe.create!(@valid_attributes)
  end
end
