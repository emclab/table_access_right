# encoding: utf-8
class SysUserRight < ActiveRecord::Base
  before_save :check_data
  attr_accessible :sys_action_on_table_id, :sys_user_group_id, :matching_column_name, :accessable_column_name, :as => :role_new_update
  attr_accessor :sys_action_on_table_s, :sys_user_position_s, :table_name_s
  attr_accessible :sys_action_on_table_s, :sys_user_position_s, :table_name_s, :as => :role_search
  
  belongs_to :sys_action_on_table
  belongs_to :sys_user_group
  
  validates_presence_of :sys_action_on_table_id
  validates_presence_of :sys_user_group_id
  validates :sys_action_on_table_id, :uniqueness => {:scope => :sys_user_group_id}
  
  def find_sys_user_rights
    rights = SysUserRight.order("sys_user_group_id, sys_action_on_table_id")
    rights = rights.where("sys_user_group_id = ?", sys_user_position_s) if sys_user_position_s.present?
    rights = rights.joins(:sys_action_on_table).where("sys_action_on_tables.action = ?", sys_action_on_table_s) if sys_action_on_table_s.present?
    rights = rights.joins(:sys_action_on_table).where("sys_action_on_tables.table_name = ?", table_name_s) if table_name_s.present?
    rights
  end

  def check_data
    #accessable column only comes with action (without all)
    return false if SysActionOnTable.find_by_id(sys_action_on_table_id).action[-4..-1] == '_all' && accessable_column_name.present?
    return true
  end
end
