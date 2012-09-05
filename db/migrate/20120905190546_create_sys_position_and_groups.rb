class CreateSysPositionAndGroups < ActiveRecord::Migration
  def change
    create_table :sys_position_and_groups do |t|
      t.integer :sys_module_id
      t.integer :sys_user_position_id

      t.timestamps
    end
  end
end
