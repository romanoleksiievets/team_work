class ManageRolesOnOrgranizationsAndProjects < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :organizations_users, :role, :integer, default: 0
    add_column :projects_users, :role, :integer, default: 0
  end
end
