require 'rails_helper'

RSpec.describe PurchaseTicket, type: :model do
  context 'event belongs to specific purchase' do
    it { should belong_to(:purchase) }
  end
end
