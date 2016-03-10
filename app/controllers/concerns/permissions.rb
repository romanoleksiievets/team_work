module Permissions
  extend ActiveSupport::Concern

  included do
  end

  def admin_only
    permission_error 'Only admin can access this page.' unless current_user.admin_permissions?
  end

  def organization_admin_only
    permission_error 'Only organization admin can access this page.' unless current_user
    .organization_admin_permissions?(current_organization)
  end

  def organization_member_only
    permission_error 'Only organization member can access this page.' unless current_user
    .organization_member_permissions?(current_organization)
  end

  def project_admin_only
    permission_error 'Only project admin can access this page.' unless current_user
    .project_admin_permissions?(current_project.try(:id))
  end

  def project_member_only
    permission_error 'Only project member can access this page.' unless current_user
    .project_member_permissions?(current_project.try(:id))
  end

private

  def permission_error(message)
      flash[:alert] = message
      redirect_to(root_path)
  end
end
