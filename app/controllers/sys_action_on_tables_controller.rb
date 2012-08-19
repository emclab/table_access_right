# encoding: utf-8
class SysActionOnTablesController < ApplicationController
  def index
    @sys_action_on_tables = SysActionOnTable.order("table_name, action")
  end

  def new
    @sys_action_on_table = SysActionOnTable.new
  end

  def create
    @sys_action_on_table = SysActionOnTable.new(params[:sys_action_on_table], :as => :role_new_update)
    if @sys_action_on_table.save
      redirect_to sys_action_on_tables_path, :notice => 'Saved!'
    else
      flash[:notice] = 'Data error!'
      render 'new'
    end
  end

  def edit
    @sys_action_on_table = SysActionOnTable.find(params[:id])
  end

  def update
    @sys_action_on_table = SysActionOnTable.find(params[:id])
    if @sys_action_on_table.update_attributes(params[:sys_action_on_table], :as => :role_new_update)
      redirect_to sys_action_on_tables_path, :notice => 'Updated!'
    else
      flash[:notice] = 'Data error!'
      render 'edit'      
    end    
  end

  def destroy
    @sys_action_on_table = SysActionOnTable.find(params[:id])
    @sys_action_on_table.transaction do
      @sys_action_on_table.destroy
      sys_user_rights = SysUserRight.where("sys_action_on_table_id = ?", @sys_action_on_table.id)
      sys_user_rights.each do |r|
        r.destroy
      end
    end
    redirect_to sys_action_on_tables_path, :notice => 'Destroyed!'
  end
end
