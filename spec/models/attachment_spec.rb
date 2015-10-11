require 'rails_helper'

RSpec.describe Attachment, type: :model do

  context 'connections and validations' do
    it { should belong_to(:project) }
    it { should belong_to(:owner) }
  end
end
