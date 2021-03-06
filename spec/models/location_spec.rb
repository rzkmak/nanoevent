require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'location name validation' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(50) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end

  context 'location address validation' do
    it { is_expected.to validate_presence_of(:address) }

    it { is_expected.to validate_length_of(:address).is_at_most(50) }

    it { is_expected.to validate_length_of(:address).is_at_least(5) }
  end

  context 'location city validation' do
    it { is_expected.to validate_presence_of(:city) }

    it { is_expected.to validate_length_of(:city).is_at_most(20) }

    it { is_expected.to validate_length_of(:city).is_at_least(2) }
  end

  context 'location latitude validation' do
    it { is_expected.to validate_presence_of(:latitude) }
  end

  context 'location longitude validation' do
    it { is_expected.to validate_presence_of(:longitude) }
  end

  context 'event in location' do
    it { should have_many(:events) }
  end
end
