class SysActionOnTable < ActiveRecord::Base

  attr_accessible :action, :table_name, :as => :role_new_update
  
  has_many :sys_user_groups, :through => :sys_user_rights
  
  validates_presence_of :action
  validates_presence_of :table_name
end
