class ManageRolesOnOrgranizationsAndProjects < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :projects_users, :role, :integer, default: 0
    change_column_default :organizations_users, :role, default: 0
  end
end
