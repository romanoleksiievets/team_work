class Organization < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :organizations_users
  has_many :integrations
  has_many :users, through: :organizations_users

  validates :name, :domain, presence: true, uniqueness: { case_sensitive: false}, length: { maximum: 50 }

  # methods to access integration like .esputnik
  Integration.names.each_pair do |integration_name, i|
    define_method integration_name do
      integration = self.integrations.find_by_name(integration_name)
      return nil unless integration
      "RestClient::#{integration_name.humanize}".constantize.new(integration.id)
    end
  end

  # def esputnik
  #   integration = self.integrations.find_by_name("esputnik")
  #   return nil unless integration
  #   RestClient::Esputnic.new(integration.id)
  # end

end
