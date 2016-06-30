class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.integer :organization_id
      t.integer :name
      t.string :url
      t.integer :auth_type
      t.string :auth_token

      t.timestamps null: false
    end
  end
end
