class Attachment < ActiveRecord::Base

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment
  #validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/


  belongs_to :project
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

end

