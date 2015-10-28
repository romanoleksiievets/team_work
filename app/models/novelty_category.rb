class NoveltyCategory < ActiveRecord::Base
  has_many :novelties
  default_scope { order(updated_at: :desc) }
  validates_presence_of :color, :name

  scope :get_id_name, -> { NoveltyCategory.all.collect  {|k| [k.id, k.name] }}
  scope :get_name_id, -> { NoveltyCategory.all.collect  {|k| [ k.name, k.id] }}
end
