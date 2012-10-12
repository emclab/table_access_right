class RenameSysUserGroupIdInSysUserRights < ActiveRecord::Migration
  change_table :sys_user_rights do |t|
     t.rename :sys_user_position_group_id, :sys_user_group_id
  end
end
