class CreateOrganizationsUsers < ActiveRecord::Migration
  def up
    create_table :organizations_users do |t|
      t.integer :organization_id, index: true
      t.integer :user_id, index: true
      t.integer :role
    end
    User.find_each {|u| u.organizations << Organization.first unless u.organizations.present?}
  end

  def down
    drop_table :organizations_users
  end
end
