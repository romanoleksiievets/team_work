class Organization < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :users, through: :organizations_users

  validates :name, presence: true, uniqueness: { case_sensitive: false}, length: { maximum: 50 }
end
