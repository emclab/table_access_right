# encoding: utf-8
class SysUserGroupsController < ApplicationController
  def index
    @sys_user_groups = SysUserGroup.order("user_group_name")
  end

  def new
    @sys_user_group = SysUserGroup.new
  end

  def create
    strip_params
    @sys_user_group = SysUserGroup.new(params[:sys_user_group], :as => :role_new)
    if @sys_user_group.save
      redirect_to sys_user_groups_path, :notice => 'Saved'
    else
      flash[:notice] = 'Data error. Not saved'
      render 'new'
    end
  end

  def edit
    @sys_user_group = SysUserGroup.find(params[:id])
  end

  def update
    strip_params
    @sys_user_group = SysUserGroup.find(params[:id])
    if @sys_user_group.update_attributes(params[:sys_user_group], :as => :role_update)
      redirect_to sys_user_groups_path, :notice => 'Updated'
    else
      flash[:notice] = 'Data error. No update'
      render 'edit'
    end
  end
  
  def destroy
    @sys_user_group = SysUserGroup.find(params[:id])
    @sys_user_group.transaction do    
      sys_user_rights = SysUserRight.where("sys_user_group_id = ?", @sys_user_group.id)
      sys_user_rights.each do |r|
        r.destroy
      end
      @sys_user_group.destroy
    end 
    redirect_to sys_user_groups_path, :notice => 'Destroyed'  
  end
  
  def strip_params
    params[:sys_user_group][:user_group_name] = params[:sys_user_group][:user_group_name].strip if params[:sys_user_group][:user_group_name].present?
  end
end
