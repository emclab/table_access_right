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
    a = FactoryGirl.create(:sys_action_on_table)
    r = FactoryGirl.create(:sys_user_right, :sys_action_on_table_id => a.id)
    r1 = FactoryGirl.build(:sys_user_right, :sys_action_on_table_id => a.id)
    r1.should_not be_valid
  end

  describe "before_save callback: check_data" do
    it "should return false if _all right comes with a non nil accessable column name" do
      action = FactoryGirl.create(:sys_action_on_table, :action => "index_all")
      r = FactoryGirl.build(:sys_user_right, :sys_action_on_table_id => action.id, :accessable_column_name => 'customer_id')
      r.check_data.should be_false
    end

    it "should return true if non nil accessable column name comes with a action without _all" do
      action = FactoryGirl.create(:sys_action_on_table, :action => "index")
      r = FactoryGirl.build(:sys_user_right, :sys_action_on_table_id => action.id, :accessable_column_name => "customer_id")
      r.check_data.should be_true
    end
  end
    
end
