# encoding: utf-8
class SysUserPositionsController < ApplicationController
  def index
    @sys_user_positions = SysUserPosition.order("position")
  end

  def new
    @sys_user_position = SysUserPosition.new
  end

  def create
    @sys_user_position = SysUserPosition.new(params[:sys_user_position], :as => :role_new)
    if @sys_user_position.save
      redirect_to sys_user_positions_path, :notice => 'Saved'
    else
      flash[:notice] = 'Data error. Not saved'
      render 'new'
    end
  end

  def edit
    @sys_user_position = SysUserPosition.find(params[:id])
  end

  def update
    @sys_user_position = SysUserPosition.find(params[:id])
    if @sys_user_position.update_attributes(params[:sys_user_position], :as => :role_update)
      redirect_to sys_user_positions_path, :notice => 'Updated'
    else
      flash[:notice] = 'Data error. No update'
      render 'edit'
    end
  end
  
  def destroy
    @sys_user_position = SysUserPosition.find(params[:id])
    @sys_user_position.transaction do
      @sys_user_position.destroy
      sys_user_rights = SysUserRight.where("sys_user_position_id = ?", @sys_user_position.id)
      sys_user_rights.each do |r|
        r.destroy
      end
    end 
    redirect_to sys_user_positions_path, :notice => 'Destroyed'  
  end
end
