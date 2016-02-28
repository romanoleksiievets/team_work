class OrganizationsUser < ActiveRecord::Base
  enum role: { member: 0, admin: 1 }
end
