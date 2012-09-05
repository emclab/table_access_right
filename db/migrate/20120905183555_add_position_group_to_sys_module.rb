class AddPositionGroupToSysModule < ActiveRecord::Migration
  def change
    add_column :sys_modules, :position_group, :string
  end
end
