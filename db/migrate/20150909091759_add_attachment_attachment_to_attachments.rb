class AddAttachmentAttachmentToAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :attachment
      t.integer :project_id
      t.integer :user_id
    end
  end
end
