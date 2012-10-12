# encoding: utf-8
class SysModuleMappingsController < ApplicationController
  def index
    @sys_module_mappings = SysModuleMapping.order("sys_module_id, sys_user_group_id")
  end

  def new
    @sys_module_mapping = SysModuleMapping.new
  end

  def create
    @sys_module_mapping = SysModuleMapping.new(params[:sys_module_mapping], :as => :role_new)
    if @sys_module_mapping.save
      redirect_to sys_module_mappings_path
    else
      flash.now[:notice] = 'Data error. Not saved!'
      render 'new'
    end
  end

  def edit
    @sys_module_mapping = SysModuleMapping.find(params[:id])
  end

  def update
    @sys_module_mapping = SysModuleMapping.find(params[:id])
    if @sys_module_mapping.update_attributes(params[:sys_module_mapping], :as => :role_new)
      redirect_to sys_module_mappings_path
    else
      flash.now[:notice] = 'Data error. Not modified!'
      render "edit"
    end
  end

  def destroy
    @sys_module_mapping = SysModuleMapping.find(params[:id])
    @sys_module_mapping.destroy
    redirect_to sys_module_mappings_path
  end
end
