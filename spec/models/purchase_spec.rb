require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'purchase customer validation' do
    it { should belong_to(:customer) }
  end
end
