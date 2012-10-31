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

  it "should reject duplidate action name" do
    p = FactoryGirl.create(:sys_action_on_table, :action => 'Action')
    p1 = FactoryGirl.build(:sys_action_on_table, :action => 'action')
    p1.should_not be_valid
  end

  it "should reject duplidate table name" do
    p = FactoryGirl.create(:sys_action_on_table, :table_name => 'users')
    p1 = FactoryGirl.build(:sys_action_on_table, :table_name => 'UserS')
    p1.should_not be_valid
  end

end
