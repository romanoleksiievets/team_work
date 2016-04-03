class ApplicationController < ActionController::Base
  include Permissions
  protect_from_forgery with: :exception
  helper_method :current_organization

  before_action :validate_domain
  before_action :authenticate_user!#, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name]
    devise_parameter_sanitizer.for(:account_update).concat [:name]
  end

protected

  def current_domain
    ENV["DOMAIN"].presence || request.domain
  end

  def current_subdomain
    ENV["SUBDOMAIN"].presence || request.subdomain
  end

  def current_organization(domain_or_subdomain=nil)
    #TODO: need cache organizations list and first organization
    return @current_organization if @current_organization.present?
    current_organization = Organization.find_by_domain(current_domain) || Organization.find_by_subdomain(current_subdomain)
    @current_organization = Rails.env.development? ? current_organization || Organization.first : current_organization
  end

private

  def root?(type="/")
    request.path == type
  end

  def localhost?
    localhost = %w(127.0.0.0 localhost 0.0.0.0 lvh.me team_work)
    localhost.include?(request.domain)
  end

  def validate_domain
    if current_organization.present?
      true
    else
      redirect_to root_path, alert: "Organization with domain = #{request.domain} and subdomain = #{request.subdomain} didn't find. Domain or subdomain is incorrect."
    end
  end

  def set_locale
    I18n.locale = params[:locale]
  end
end
