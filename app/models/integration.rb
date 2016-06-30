class Integration < ActiveRecord::Base
  belongs_to :organization
  before_save :encode_credentials

  attr_accessor :login, :password
  enum name: [:esputnik]
  enum auth_type: [:basic]

  def encode_credentials
    self.auth_token = Base64.encode64("#{login}:#{password}")
  end
end
