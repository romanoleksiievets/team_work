class Campaign < ActiveRecord::Base
  belongs_to :user
  enum type: [:email, :sms]
  enum status: [:will_be_send_at, :sending, :sent]
end
