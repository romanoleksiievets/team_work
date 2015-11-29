class RoleConstraint
  def initialize(*roles)
    @roles = roles
  end

  def matches?(request)
    return false unless request.env['warden'].user
    true
  end
end
