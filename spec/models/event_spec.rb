require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'event belongs to specific location' do
    it { should belong_to(:location) }
  end
end
