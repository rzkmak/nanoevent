require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'ticket belong to specific event' do
    it { should belong_to(:event) }
  end

  context 'ticket name validation' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(20) }
  end
end
