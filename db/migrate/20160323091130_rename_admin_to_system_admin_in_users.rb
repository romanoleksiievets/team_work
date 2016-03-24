class RenameAdminToSystemAdminInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :admin, :system_admin
  end
end
