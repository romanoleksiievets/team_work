class NoveltyCategory < ActiveRecord::Base
  has_many :novelties
  validates_presence_of :color, :name

  scope :get_id_name, -> { NoveltyCategory.all.collect  {|k| [k.id, k.name] }}
  scope :get_name_id, -> { NoveltyCategory.all.collect  {|k| [ k.name, k.id] }}
  #or this : see us example # scope :get_id_name, -> { NoveltyCategory.all.map  {|k| "#{k.id},#{k.name}".split(",") } }

end
