class AddPolymorphicToAttachments < ActiveRecord::Migration
  def change
    rename_column :attachments, :project_id, :attachable_id
    add_column :attachments, :attachable_type, :string, index: true

    Attachment.update_all(attachable_type: "Project")
  end
end
