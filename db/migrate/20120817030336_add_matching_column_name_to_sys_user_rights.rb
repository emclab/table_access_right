class AddMatchingColumnNameToSysUserRights < ActiveRecord::Migration
  def change
    add_column :sys_user_rights, :matching_column_name, :string
  end
end
