class OrganizationsUser < ActiveRecord::Base
  enum role: { member: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?

  belongs_to :organization
  belongs_to :user

  validates_uniqueness_of :user, scope: :organization, message: "already added to this organization."
  validates :organization_id, presence: true
  validates :user_id, presence: true

  # def active_for_authentication?
  #   super && active?
  # end

private

  def set_default_role
    self.role ||= :member
  end

end
