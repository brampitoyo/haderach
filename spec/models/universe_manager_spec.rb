require 'spec_helper'

describe UniverseManager do
  before(:each) do
    @valid_attributes = {
      :manager_id => 1,
      :universe_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    UniverseManager.create!(@valid_attributes)
  end
end
