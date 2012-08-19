module ApplicationHelper
  def return_table_name_list
     ActiveRecord::Base.connection.tables - ['sys_user_positions', 'sys_action_on_tables', 'sys_user_rights', 'schema_migrations']
  end
end
