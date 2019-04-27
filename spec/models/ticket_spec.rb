require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'ticket belong to specific event' do
    it { should belong_to(:event) }
  end

  context 'ticket name validation' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(20) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end

  context 'ticket quota validation' do
    it { is_expected.to validate_presence_of(:quota) }
  end

  context 'ticket price validation' do
    it { is_expected.to validate_presence_of(:price) }
  end

  context 'ticket description validation' do
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_length_of(:description).is_at_most(50) }

    it { is_expected.to validate_length_of(:description).is_at_least(5) }
  end

  context 'ticket start_sell validation' do
    it { is_expected.to validate_presence_of(:start_sell) }
  end

  context 'ticket end_sell validation' do
    it { is_expected.to validate_presence_of(:end_sell) }
  end

  context 'purchase_ticket validation' do
    it { should have_many(:purchase_tickets) }
  end
end
