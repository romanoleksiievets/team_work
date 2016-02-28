class ProjectsUser < ActiveRecord::Base
  enum role: { member: 0, admin: 1 }
end
