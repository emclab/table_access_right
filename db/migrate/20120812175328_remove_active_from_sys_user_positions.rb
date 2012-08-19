class RemoveActiveFromSysUserPositions < ActiveRecord::Migration
  def up
    remove_column :sys_user_positions, :active
      end

  def down
    add_column :sys_user_positions, :active, :boolean
  end
end
