class Project < ActiveRecord::Base
 validates_presence_of :title
 validates_uniqueness_of :title
 validates_presence_of :text

  has_many :comments, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_and_belongs_to_many :users

end
