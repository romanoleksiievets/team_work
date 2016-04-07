module Constraints
  class Domain
    def self.matches?(request)
      if request.domain == "team_work"
        request.subdomain.present? && request.subdomain.start_with?('aol')
      else
        true
      end
    end
  end

  class RoleConstraint
    def initialize(*roles)
      @roles = roles
    end

    def matches?(request)
      return false unless request.env['warden'].user
      true
    end
  end
end
