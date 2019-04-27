require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'customer name validation' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(30) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end

  context 'customer email validation' do
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_length_of(:email).is_at_most(30) }
  end
end
