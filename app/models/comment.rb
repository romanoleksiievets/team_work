class Comment < ActiveRecord::Base
  belongs_to :project
  validates :text, presence: true, length: {max: 25}
end
