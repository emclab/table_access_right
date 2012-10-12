# encoding: utf-8
require 'spec_helper'

describe SysUserGroup do
  it "should be OK" do
    p = FactoryGirl.build(:sys_user_group) 
    p.should be_valid
  end
  
  it "should reject nil user group name" do
    p = FactoryGirl.build(:sys_user_group, :user_group_name => nil)
    p.should_not be_valid
  end
  
  it "should reject nil short note" do
    p = FactoryGirl.build(:sys_user_group, :short_note => nil)
    p.should_not be_valid
  end
end
