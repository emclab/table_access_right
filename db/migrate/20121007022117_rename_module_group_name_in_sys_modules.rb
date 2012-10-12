class RenameModuleGroupNameInSysModules < ActiveRecord::Migration
  change_table :sys_modules do |t|
     t.rename :position_group, :module_group_name
  end
end
