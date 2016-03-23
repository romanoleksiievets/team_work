class RegistrationsController < Devise::RegistrationsController

  def new
    flash[:info] = 'Free registration is no allowed. Please, contact administrator and he will send you an invite.'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Free registration is no allowed. Please, contact administrator and he will send you an invite.'
    redirect_to root_path
  end

  protected

  def update_resource(resource, params)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    resource.update_attributes(params)
  end


  def after_update_path_for(resource)
    if current_organization.subdomain.present?
      root_path(subdomain: current_organization.subdomain)
    else
      super
    end
  end

end
