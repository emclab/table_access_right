require 'spec_helper'

describe SysModule do
  it "should be OK" do
    m = FactoryGirl.build(:sys_module)
    m.should be_valid
  end
  
  it "should reject nil module name" do
    m = FactoryGirl.build(:sys_module, :module_name => nil)
    m.should_not be_valid
  end
end
