require 'spec_helper'

describe SysModuleMapping do
  it "should be OK" do
    p = FactoryGirl.build(:sys_module_mapping)
    p.should be_valid
  end
  
  it "should reject nil user group id" do
    p = FactoryGirl.build(:sys_module_mapping, :sys_user_group_id => nil)
    p.should_not be_valid
  end
  
  it "should reject nil module id" do
    p = FactoryGirl.build(:sys_module_mapping, :sys_module_id => nil)
    p.should_not be_valid
  end
    
end
