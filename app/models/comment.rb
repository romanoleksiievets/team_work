class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  validates_presence_of :text
  default_scope { order(created_at: :desc) }
end
