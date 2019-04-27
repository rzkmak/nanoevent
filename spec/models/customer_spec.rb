require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'customer name validation' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(30) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end
end
