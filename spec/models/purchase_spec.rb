require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'purchase customer validation' do
    it { should belong_to(:customer) }
  end

  context 'purchase_ticket validation' do
    it { should have_many(:purchase_tickets) }
  end
end
