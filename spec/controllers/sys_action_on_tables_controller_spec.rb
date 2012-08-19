require 'spec_helper'

describe SysActionOnTablesController do

  describe "GET 'index'" do
    it "be OK" do
      p = FactoryGirl.create(:sys_action_on_table)
      get 'index'
      response.should be_success
      assigns(:sys_action_on_tables).should eq([p])
    end
  end

  describe "GET 'new'" do
    it "be OK" do
      p = FactoryGirl.attributes_for(:sys_action_on_table)
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "be OK" do
      p = FactoryGirl.attributes_for(:sys_action_on_table)
      lambda do
        get 'create', :sys_action_on_table => p
        response.should redirect_to sys_action_on_tables_path
      end.should change(SysActionOnTable, :count).by(1)
    end
    
    it "should reject nil action" do
      p = FactoryGirl.attributes_for(:sys_action_on_table, :action => nil)
      lambda do
        get 'create', :sys_action_on_table => p
        response.should render_template("new")
      end.should change(SysActionOnTable, :count).by(0)    
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      p = FactoryGirl.create(:sys_action_on_table)
      get 'edit', :id => p.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "be OK" do
      p = FactoryGirl.create(:sys_action_on_table)
      get 'update', :id => p.id, :sys_action_on_table => {:action => 'a new action'}
      response.should redirect_to sys_action_on_tables_path
    end
    
    it "should reject nil table name" do
      p = FactoryGirl.create(:sys_action_on_table)
      get 'update', :id => p.id, :sys_action_on_table => {:table_name => ''}
      response.should render_template('edit')
    end
  end

  describe "GET 'destroy'" do
    it "be success" do
      p = FactoryGirl.create(:sys_action_on_table)
      get 'destroy', :id => p.id
      response.should redirect_to sys_action_on_tables_path
    end
  end

end
