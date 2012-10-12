require 'spec_helper'

describe SysModuleMappingsController do

  describe "GET 'index'" do
    it "returns http success" do
      po = FactoryGirl.create(:sys_user_group)
      mo = FactoryGirl.create(:sys_module)
      p = FactoryGirl.create(:sys_module_mapping, :sys_user_group_id => po.id, :sys_module_id => mo.id)
      get 'index'
      response.should be_success
      assigns(:sys_module_mappings).should eq([p])
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      m = FactoryGirl.attributes_for(:sys_module_mapping)
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      m = FactoryGirl.attributes_for(:sys_module_mapping)
      get 'create', :sys_module_mapping => m
      response.should redirect_to sys_module_mappings_path
    end
    
    it "should reject nil position_id" do
      m = FactoryGirl.attributes_for(:sys_module_mapping, :sys_user_group_id => nil)
      get 'create', :sys_module_mapping => m
      response.should render_template("new")
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module_mapping)
      get 'edit', :id => m.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module_mapping)
      get 'update', :id => m.id, :sys_module_mapping => {:sys_module_id => 2}
      response.should redirect_to sys_module_mappings_path
    end
    
    it "should reject nil module id" do
      m = FactoryGirl.create(:sys_module_mapping)
      get 'update', :id => m.id, :sys_module_mapping => {:sys_user_group_id => nil}
      response.should render_template('edit')
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module_mapping)
      get 'destroy', :id => m.id
      response.should redirect_to sys_module_mappings_path
    end
  end

end
