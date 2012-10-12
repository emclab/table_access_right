require 'spec_helper'

describe SysModulesController do

  describe "GET 'index'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module)
      get 'index'
      response.should be_success
      assigns(:sys_modules).should eq([m])
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      m = FactoryGirl.attributes_for(:sys_module)
      lambda do
        get 'create', :sys_module => m
        response.should redirect_to sys_modules_path
      end.should change(SysModule, :count).by(1)
    end
    
    it "shoud reject nil module name" do
      m = FactoryGirl.attributes_for(:sys_module, :module_name => nil)
      lambda do
        get 'create', :sys_module => m
        response.should render_template('new')
      end.should change(SysModule, :count).by(0)      
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module)
      get 'edit', :id => m.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module)
      get 'update', :id => m.id, :sys_module => {:module_name => 'a nnew name'}
      response.should redirect_to sys_modules_path
    end
    
    it "should render edit if nil module group name" do
      m = FactoryGirl.create(:sys_module)
      get 'update', :id => m.id, :sys_module => {:module_group_name => ''}   
      response.should render_template('edit')   
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      m = FactoryGirl.create(:sys_module)
      get 'destroy', :id => m.id
      response.should redirect_to sys_modules_path
    end
  end

end
