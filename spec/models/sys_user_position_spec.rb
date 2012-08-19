require 'spec_helper'

describe SysUserPosition do
  it "should be OK" do
    p = FactoryGirl.build(:sys_user_position) 
    p.should be_valid
  end
  
  it "should reject nil position name" do
    p = FactoryGirl.build(:sys_user_position, :position_name => nil)
    p.should_not be_valid
  end
  
  it "should reject nil position" do
    p = FactoryGirl.build(:sys_user_position, :position => nil)
    p.should_not be_valid
  end
end
