class Page < ActiveRecord::Base
  validates :title, :url, :position, presence: true

  scope :order_position, -> { order("position ASC")}
end
