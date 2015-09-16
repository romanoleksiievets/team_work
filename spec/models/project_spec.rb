require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:comments) }
  it { should have_many(:attachments) }
  it { should belong_to(:owner) }
  it { should have_and_belong_to_many(:users) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
end
