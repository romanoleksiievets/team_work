class ApplicationController < ActionController::Base
  include Permissions
  protect_from_forgery with: :exception
  helper_method :current_organization

  before_action :subdomain, :authenticate_user!#, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def subdomain
    raise ActionController::RoutingError.new('Not Found') unless Organization.find_by_name(request.subdomain)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name]
    devise_parameter_sanitizer.for(:account_update).concat [:name]
  end

protected

  def current_organization
    @current_organization ||= Organization.find_by_name(request.subdomain)
  end

end
