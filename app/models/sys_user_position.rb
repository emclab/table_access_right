# encoding: utf-8
class SysUserPosition < ActiveRecord::Base
  attr_accessible :position, :position_name, :as => :role_new
  attr_accessible :position, :position_name, :as => :role_update
  
  has_many :sys_action_on_tables, :through => :sys_user_rights
  
  validates_presence_of :position
  validates_presence_of :position_name
  
 # scope :active_position, where(:active => true)
end
