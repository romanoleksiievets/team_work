module UserRoles
  extend ActiveSupport::Concern
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
