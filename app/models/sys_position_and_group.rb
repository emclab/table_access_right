class SysPositionAndGroup < ActiveRecord::Base
  
  belongs_to :sys_user_position
  belongs_to :sys_module
  
  attr_accessible :sys_module_id, :sys_user_position_id, :as => :role_new
  
  validates_presence_of :sys_module_id
  validates_presence_of :sys_user_position_id
end
