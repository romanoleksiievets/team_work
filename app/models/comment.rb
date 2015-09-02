class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates_presence_of :text
  default_scope { order(created_at: :desc) }
end
