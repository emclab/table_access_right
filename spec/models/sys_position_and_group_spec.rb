require 'spec_helper'

describe SysPositionAndGroup do
  it "should be OK" do
    p = FactoryGirl.build(:sys_position_and_group)
    p.should be_valid
  end
  
  it "should reject nil user poistion id" do
    p = FactoryGirl.build(:sys_position_and_group, :sys_user_position_id => nil)
    p.should_not be_valid
  end
  
  it "should reject nil module id" do
    p = FactoryGirl.build(:sys_position_and_group, :sys_module_id => nil)
    p.should_not be_valid
  end
    
end
