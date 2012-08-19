require 'spec_helper'

describe SysUserPositionsController do

  describe "GET 'index'" do
    it "should return index" do
      p = FactoryGirl.create(:sys_user_position)
      get 'index'
      response.should be_success
      assigns(:sys_user_positions).should eq([p])
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
      p = FactoryGirl.attributes_for(:sys_user_position)
      lambda do
        get 'create', :sys_user_position => p
        response.should redirect_to sys_user_positions_path
      end.should change(SysUserPosition, :count).by(1)
    end
    
    it "should render new if data error" do
      p = FactoryGirl.attributes_for(:sys_user_position, :position => nil) 
      get 'create', :sys_user_position => p
      response.should render_template('new')
    end
  end

  describe "GET 'edit'" do
    it "OK to edit" do
      p = FactoryGirl.create(:sys_user_position)
      get 'edit', :id => p.id, :sys_user_position => {:position_name => 'changed'}
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should update" do
      p = FactoryGirl.create(:sys_user_position)
      get 'update', :id => p.id, :sys_user_position => {:position_name => 'changed'}
      response.should redirect_to sys_user_positions_path
    end
    
    it "should render edit if data error" do
      p = FactoryGirl.create(:sys_user_position)
      get 'update', :id => p.id, :sys_user_position => {:position_name => ''}
      response.should render_template('edit')
    end
  end

end
