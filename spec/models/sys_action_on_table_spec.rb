require 'spec_helper'

describe SysActionOnTable do
  it "should be OK" do
    p = FactoryGirl.build(:sys_action_on_table) 
    p.should be_valid
  end
  
  it "should reject nil table name" do
    p = FactoryGirl.build(:sys_action_on_table, :table_name => nil)
    p.should_not be_valid
  end
  
  it "should reject nil action" do
    p = FactoryGirl.build(:sys_action_on_table, :action => nil)
    p.should_not be_valid
  end
end
