require 'spec_helper'

describe SysUserRightsController do

  render_views
  
  describe "GET 'index'" do
    it "be OK" do
      p = FactoryGirl.create(:sys_user_group)
      a = FactoryGirl.create(:sys_action_on_table)
      r = FactoryGirl.create(:sys_user_right, :sys_action_on_table_id => a.id, :sys_user_group_id => p.id)
      get 'index'
      response.should be_success
      assigns(:sys_user_rights).should eq([r])
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
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should delete" do
      r = FactoryGirl.create(:sys_user_right)
      lambda do
        get 'destroy', :id => r.id
        response.should be_success
      end.should change(SysUserRight, :count).by(-1)
    end
  end

end
