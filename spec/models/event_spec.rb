require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'event belongs to specific location' do
    it { should belong_to(:location) }
  end

  context 'event name validation' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(20) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end

  context 'event organizer validation' do
    it { is_expected.to validate_presence_of(:organizer) }

    it { is_expected.to validate_length_of(:organizer).is_at_most(50) }

    it { is_expected.to validate_length_of(:organizer).is_at_least(2) }
  end

  context 'event capacity validation' do
    it { is_expected.to validate_presence_of(:capacity) }
  end

  context 'event start_date validation' do
    it { is_expected.to validate_presence_of(:start_date) }
  end

  context 'event end_date validation' do
    it { is_expected.to validate_presence_of(:end_date) }
  end

  context 'event has many ticket' do
    it { should have_many(:tickets) }
  end
end
