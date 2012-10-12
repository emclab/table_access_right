# encoding: utf-8
class SysModulesController < ApplicationController
  def index
    @sys_modules = SysModule.order("module_name")
  end

  def new
    @sys_module = SysModule.new
  end

  def create
    @sys_module = SysModule.new(params[:sys_module], :as => :role_new)
    if @sys_module.save
      redirect_to sys_modules_path, :notice => 'Saved!'
    else
      flash.now[:notice] = 'Data error. Not saved!'
      render 'new'
    end
  end

  def edit
    @sys_module = SysModule.find(params[:id])
  end

  def update
    @sys_module = SysModule.find(params[:id])
    if @sys_module.update_attributes(params[:sys_module], :as => :role_new)
      redirect_to sys_modules_path, :notice => 'Modified!'
    else
      flash.now[:notice] = 'Data error. Not Modified!'
      render 'edit'
    end
  end

  def destroy
    @sys_module = SysModule.find(params[:id])
    @sys_module.transaction do
      SysModuleMapping.where("sys_module_id = ?", @sys_module.id).each do |r|
        r.destroy
      end
      @sys_module.destroy
    end
    redirect_to sys_modules_path, :notice => 'Destroyed'
  end
end
