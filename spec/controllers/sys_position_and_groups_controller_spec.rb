require 'spec_helper'

describe SysPositionAndGroupsController do

  describe "GET 'index'" do
    it "returns http success" do
      po = FactoryGirl.create(:sys_user_position)
      mo = FactoryGirl.create(:sys_module)
      p = FactoryGirl.create(:sys_position_and_group, :sys_user_position_id => po.id, :sys_module_id => mo.id)
      get 'index'
      response.should be_success
      assigns(:sys_position_and_groups).should eq([p])
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      m = FactoryGirl.attributes_for(:sys_position_and_group)
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      m = FactoryGirl.attributes_for(:sys_position_and_group)
      get 'create', :sys_position_and_group => m
      response.should redirect_to sys_position_and_groups_path
    end
    
    it "should reject nil position_id" do
      m = FactoryGirl.attributes_for(:sys_position_and_group, :sys_user_position_id => nil)
      get 'create', :sys_position_and_group => m
      response.should render_template("new")
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_position_and_group)
      get 'edit', :id => m.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_position_and_group)
      get 'update', :id => m.id, :sys_position_and_group => {:sys_module_id => 2}
      response.should redirect_to sys_position_and_groups_path
    end
    
    it "should reject nil module id" do
      m = FactoryGirl.create(:sys_position_and_group)
      get 'update', :id => m.id, :sys_position_and_group => {:sys_user_position_id => nil}
      response.should render_template('edit')
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_position_and_group)
      get 'destroy', :id => m.id
      response.should redirect_to sys_position_and_groups_path
    end
  end

end
