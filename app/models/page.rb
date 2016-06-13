class Page < ActiveRecord::Base
  translates :title, :body, :description
  validates :title, :url, :position, presence: true

  scope :order_position, -> { order("position ASC")}
end
