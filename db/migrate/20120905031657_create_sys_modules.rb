class CreateSysModules < ActiveRecord::Migration
  def change
    create_table :sys_modules do |t|
      t.string :module_name

      t.timestamps
    end
  end
end
