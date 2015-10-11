require 'rails_helper'

RSpec.describe Comment, type: :model do

  context 'connections and validations' do
    it { should belong_to(:project) }
    it { should belong_to(:owner) }

    it { should validate_presence_of :text }
  end
end
