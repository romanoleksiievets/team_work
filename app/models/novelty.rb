class Novelty < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  belongs_to :novelty_category
  validates_presence_of :body, :title
end
