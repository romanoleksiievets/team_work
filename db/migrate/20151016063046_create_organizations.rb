class CreateOrganizations < ActiveRecord::Migration
  def up
    create_table :organizations do |t|
      t.integer :owner_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end

  def down
    drop_table :organizations
  end
end
