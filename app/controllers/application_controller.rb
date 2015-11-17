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
    @current_organization ||= Organization.find_by_subdomain(request.subdomain)
  end

private

  def root?
    request.path == "/"
  end

  def localhost?
    localhost = %w(127.0.0.0 localhost 0.0.0.0)
    localhost.include?(request.domain)
  end

  def validate_subdomain
    subdomain_free_paths = %w(/ /users/login)
    @current_organization = Organization.find_by_subdomain(request.subdomain)
    unless subdomain_free_paths.include?(request.path) || @current_organization.present?
      flash[:alert] = "Organization #{request.subdomain} didn't find. Domain or subdomain is incorrect."
      redirect_to(root_path)
    end
  end

end
