class SysModule < ActiveRecord::Base
  attr_accessible :module_name, :module_group_name, :as => :role_new
  
  validates_presence_of :module_name
  validates_presence_of :module_group_name
end
