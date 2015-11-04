class User < ActiveRecord::Base
  validates_presence_of :name

  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :projects
  has_many :my_organizations, class_name: "Organization", foreign_key: :owner_id
  has_many :my_projects, class_name: "Project", foreign_key: :owner_id
  has_many :comments, foreign_key: :owner_id
  has_many :attachments

  enum role: [:admin, :employee]
  enum status: [:active, :blocked, :invited]

  scope :free_users, -> (project) { User.where.not(id: (project.user_ids + [project.owner.id])) }


  def admin_permissions?
    admin
  end

  def organization_admin_permissions?(organization_id)
    admin_permissions? || OrganizationsUser.where(user_id: self.id, organization_id: organization_id).first.try(:admin?)
  end

  def organization_member_permissions?(organization_id)
    admin_permissions? || OrganizationsUser.where(user_id: self.id, organization_id: organization_id).first.present?
  end

  def project_admin_permissions?(project_id, organization_id)
    organization_admin_permissions?(organization_id) || (organization_member_permissions?(organization_id) && ProjectsUser.where(user_id: self.id, project_id: project_id).first.try(:admin?))
  end

  def project_member_permissions?(project_id, organization_id)
    project_admin_permissions?(project_id, organization_id) || project_member?(project_id)
  end

  def organization_member?(organization_id)
    OrganizationsUser.where(user_id: self.id, organization_id: organization_id).first.present?
  end

  def project_member?(project_id)
    organization_id = Project.find(project_id).try(:organization_id)
    organization_member?(organization_id) && ProjectsUser.where(user_id: self.id, project_id: project_id).first.present?
  end

 end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
