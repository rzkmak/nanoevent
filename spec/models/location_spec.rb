require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'location name validation' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
