class UserProfile < ActiveRecord::Base
  belongs_to :user
  has_many :user_talents

  validates_presence_of :first_name, :last_name, :org_role

  enum org_role: [:volunteer, :teacher]
end
