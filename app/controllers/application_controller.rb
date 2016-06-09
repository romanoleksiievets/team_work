class ApplicationController < ActionController::Base
  MAIN_DOMAIN = "teamwork.in.ua"
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

  def main_domain?
    Rails.env.development? ? true : request.base_url.match(/^.*#{MAIN_DOMAIN}$/).present?
  end

  def current_domain
    Organization.find_each do |organization|
      domain = organization.domain
      if request.base_url.match(/^.*#{domain}$/).present?
        return @current_domain = domain
      end
    end
  end

  def current_subdomain
    main_domain = Rails.env.development? ? "localhost:3000" : MAIN_DOMAIN
    subdomain = request.base_url.match(/^(.*)\.#{main_domain}$/).try(:[], 1)
    ["www.", "http://", "https://"].each {|filter| subdomain.slice!(filter) } if subdomain.present?
    @current_subdomain = subdomain
  end

  def current_organization(domain_or_subdomain=nil)
    #TODO: need cache organizations list and first organization
    @current_organization ||= main_domain? ? Organization.find_by_subdomain(current_subdomain) : Organization.find_by_domain(current_domain)
  end

private

  def render_404_domain
    render :file => "#{Rails.root}/public/404_domain", :layout => false, :status => :not_found
  end

  def root?(type = "/")
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
      render_404_domain
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
