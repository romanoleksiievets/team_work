class NoveltyCategory < ActiveRecord::Base
  has_many :novelties
  validates_presence_of :color, :name
end
