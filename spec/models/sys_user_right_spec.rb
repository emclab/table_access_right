require 'spec_helper'

describe SysUserRight do
  it "should be OK" do
    r = FactoryGirl.build(:sys_user_right)
    r.should be_valid
  end
  
  it "should reject nil sys_user_position_id" do
    r = FactoryGirl.build(:sys_user_right, :sys_user_group_id => nil)
    r.should_not be_valid
  end
  
  it "should reject nil sys_action_on_table_id" do
    r = FactoryGirl.build(:sys_user_right, :sys_action_on_table_id => nil)
    r.should_not be_valid
  end
  
  it "should reject duplidate action for the same position" do
    r = FactoryGirl.create(:sys_user_right)
    r1 = FactoryGirl.build(:sys_user_right, :sys_action_on_table_id => r.sys_action_on_table_id)
    r1.should_not be_valid
  end
    
end
