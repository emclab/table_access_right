# encoding: utf-8
class SysUserGroup < ActiveRecord::Base

  attr_accessible :short_note, :user_group_name, :as => :role_new
  attr_accessible :short_note, :user_group_name, :as => :role_update
  
  has_many :sys_action_on_tables, :through => :sys_user_rights
  
  validates_presence_of :short_note
  validates_presence_of :user_group_name
  
end
