class SysModule < ActiveRecord::Base
  attr_accessible :module_name, :position_group, :as => :role_new
  
  validates_presence_of :module_name
  validates_presence_of :position_group
end
