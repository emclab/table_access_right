class CreateSysUserRights < ActiveRecord::Migration
  def change
    create_table :sys_user_rights do |t|
      t.integer :sys_action_on_table_id
      t.integer :sys_user_position_id

      t.timestamps
    end
  end
end
