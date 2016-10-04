class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.integer :message_type
      t.string :title
      t.text :text
      t.string :target
      t.datetime :schedule
      t.boolean :confirmed
      t.integer :status
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
