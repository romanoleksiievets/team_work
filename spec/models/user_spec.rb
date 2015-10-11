require 'rails_helper'

RSpec.describe User, type: :model do
  let(:project) { FactoryGirl.create(:project) }
  let(:users) { FactoryGirl.create_list(:user, 6) }

  context 'connections and validations' do
    it { should have_many(:my_projects) }
    it { should have_many(:comments) }
    it { should have_many(:attachments) }
    it { should have_and_belong_to_many(:projects) }

    it { should validate_presence_of :name }
  end

  context "scope" do
    it "#free_users should return users without already added users to project and without owner." do
      project.users << users[0]
      project.users << users[1]
      free_users = User.free_users(project)
      expect(free_users.to_a).to match_array(users[2..5])
      expect(free_users).not_to include(project.owner)
      expect(free_users).not_to include(users[0])
      expect(free_users).not_to include(users[1])
    end
  end
end
