class Novelty < ActiveRecord::Base
  default_scope { order(updated_at: :desc) }
  belongs_to :novelty_category
  validates_presence_of :body, :title
end
