require 'rails_helper'

RSpec.describe PurchaseTicket, type: :model do
  context 'purchase belongs to specific purchase' do
    it { should belong_to(:purchase) }
  end

  context 'ticket belongs to specific ticket' do
    it { should belong_to(:ticket) }
  end
end
