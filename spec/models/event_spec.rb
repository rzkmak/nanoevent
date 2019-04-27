require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'event belongs to specific location' do
    it { should belong_to(:location) }
  end

  context 'event name validation' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
