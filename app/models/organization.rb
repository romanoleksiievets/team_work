class Organization < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: { case_sensitive: false}, length: { maximum: 50 }
end
