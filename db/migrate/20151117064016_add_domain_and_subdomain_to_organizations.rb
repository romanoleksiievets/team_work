class AddDomainAndSubdomainToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :domain, :string
    add_column :organizations, :subdomain, :string
    Organization.find_each{|o| o.update_attributes(subdomain: o.name.downcase.underscore.gsub(" ", "_") )}
  end
end
