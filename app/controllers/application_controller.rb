class ApplicationController < ActionController::Base
  include Permissions
  protect_from_forgery with: :exception
  helper_method :current_organization

  before_action :validate_subdomain
  before_action :authenticate_user!#, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name]
    devise_parameter_sanitizer.for(:account_update).concat [:name]
  end

protected

  def current_organization
    #TODO: need cache organizations list
    @current_organization ||= Organization.find_by_subdomain(request.subdomain) || Organization.find_by_domain(request.domain)
  end

private

  def root?(type="/")
    request.path == type
  end

  def localhost?
    localhost = %w(127.0.0.0 localhost 0.0.0.0 lvh.me)
    localhost.include?(request.domain)
  end

  def validate_subdomain
    if current_organization.present?
      true
    else
      if Rails.env.development?
        unless current_organization.present?
          @current_organization = Organization.first
          flash[:alert] = "Subdomains it's only way set current organization and you doest use subdomain. So, I will set first organization, as current!" if root?(authenticated_root_path)
        end
      else
        flash[:alert] = "Organization #{request.subdomain} didn't find. Domain or subdomain is incorrect."
        redirect_to(unauthenticated_root_path)
      end
    end
  end

end
