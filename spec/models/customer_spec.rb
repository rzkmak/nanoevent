require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'customer name validation' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
