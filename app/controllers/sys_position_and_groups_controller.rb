# encoding: utf-8
class SysPositionAndGroupsController < ApplicationController
  def index
    @sys_position_and_groups = SysPositionAndGroup.order("sys_module_id, sys_user_position_id")
  end

  def new
    @sys_position_and_group = SysPositionAndGroup.new
  end

  def create
    @sys_position_and_group = SysPositionAndGroup.new(params[:sys_position_and_group], :as => :role_new)
    if @sys_position_and_group.save
      redirect_to sys_position_and_groups_path
    else
      flash.now[:notice] = 'Data error. Not saved!'
      render 'new'
    end
  end

  def edit
    @sys_position_and_group = SysPositionAndGroup.find(params[:id])
  end

  def update
    @sys_position_and_group = SysPositionAndGroup.find(params[:id])
    if @sys_position_and_group.update_attributes(params[:sys_position_and_group], :as => :role_new)
      redirect_to sys_position_and_groups_path
    else
      flash.now[:notice] = 'Data error. Not modified!'
      render "edit"
    end
  end

  def destroy
    @sys_position_and_group = SysPositionAndGroup.find(params[:id])
    @sys_position_and_group.destroy
    redirect_to sys_position_and_groups_path
  end
end
