class Organization < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :organizations_users
  has_many :users, through: :organizations_users

  validates :name, presence: true, uniqueness: { case_sensitive: false}, length: { maximum: 50 }
  validate :domain_or_subdomain_presence
  validates :domain, :subdomain, allow_blank: true, uniqueness: { case_sensitive: false}, length: { maximum: 20 }


  private

  def domain_or_subdomain_presence
    errors.add(:base, "Organization should have domain or subdomain.") if domain.blank? && subdomain.blank?
  end
end
