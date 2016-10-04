class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    # if params[:password].blank?
    #   params.delete(:password)
    #   params.delete(:password_confirmation) if params[:password_confirmation].blank?
    # end
    # resource.update_attributes(params)
    resource.update_without_password(params)
  end


  def after_update_path_for(resource)
    if current_organization.subdomain.present?
      root_path(subdomain: current_organization.subdomain)
    else
      super
    end
  end

end
