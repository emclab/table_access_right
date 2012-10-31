# encoding: utf-8
class SysUserRightsController < ApplicationController
  def index
    @sys_user_rights = SysUserRight.order("sys_user_group_id, sys_action_on_table_id")
  end

  def new
    @sys_user_right = SysUserRight.new
  end

  def create
    @sys_user_right = SysUserRight.new(params[:sys_user_right], :as => :role_new_update)
    if @sys_user_right.save
      redirect_to sys_user_rights_path, :notice => 'Saved!'
    else
      flash[:notice] = 'Data error. NOT saved'
      render 'new'
    end
  end

  def destroy
    @sys_user_right = SysUserRight.find(params[:id])
    if @sys_user_right.destroy
      flash[:notice] = 'Deleted!'
    else
      flash[:notice] = 'NOT deleted!'
    end
    redirect_to sys_user_rights_path
  end
  
  def search
    @sys_user_right = SysUserRight.new(params[:sys_user_right], :as => :role_search)
  end
  
  def search_results
    @sys_user_right = SysUserRight.new(params[:sys_user_right], :as => :role_search)
    @sys_user_rights = @sys_user_right.find_sys_user_rights
    #seach params
    @search_params = search_params()    
  end
  
  protected
  
  def search_params
    search_params = "参数："
    search_params += ' TableName：' + params[:sys_user_right][:table_name_s] if params[:sys_user_right][:table_name_s].present?
    search_params += ', 用户群：' + SysUserGroup.find(params[:sys_user_right][:sys_user_position_s].to_i).position if params[:sys_user_right][:sys_user_position_s].present?
    search_params += ', 操作 ：' + params[:sys_user_right][:sys_action_on_table_s] if params[:sys_user_right][:sys_action_on_table_s].present?
    search_params
  end  
  
end
