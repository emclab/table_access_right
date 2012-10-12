require 'spec_helper'

describe SysUserGroupsController do

  describe "GET 'index'" do
    it "should return index" do
      p = FactoryGirl.create(:sys_user_group)
      get 'index'
      response.should be_success
      assigns(:sys_user_groups).should eq([p])
    end
  end

  describe "GET 'new'" do
    it "be OK" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "be OK with valid date" do
      p = FactoryGirl.attributes_for(:sys_user_group)
      lambda do
        get 'create', :sys_user_group => p
        response.should redirect_to sys_user_groups_path
      end.should change(SysUserGroup, :count).by(1)
    end
    
    it "should render new if data error" do
      p = FactoryGirl.attributes_for(:sys_user_group, :user_group_name => nil) 
      get 'create', :sys_user_group => p
      response.should render_template('new')
    end
  end

  describe "GET 'edit'" do
    it "OK to edit" do
      p = FactoryGirl.create(:sys_user_group)
      get 'edit', :id => p.id, :sys_user_group => {:user_group_name => 'changed'}
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should update" do
      p = FactoryGirl.create(:sys_user_group)
      get 'update', :id => p.id, :sys_user_group => {:user_group_name => 'changed'}
      response.should redirect_to sys_user_groups_path
    end
    
    it "should render edit if data error" do
      p = FactoryGirl.create(:sys_user_group)
      get 'update', :id => p.id, :sys_user_group => {:user_group_name => ''}
      response.should render_template('edit')
    end
  end

end
