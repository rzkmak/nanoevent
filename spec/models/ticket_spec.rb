require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'ticket belong to specific event' do
    it { should belong_to(:event) }
  end
end
