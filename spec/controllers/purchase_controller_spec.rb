require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  context 'purchase ticket with different event' do
    before do
      @first_event = create :event, id: 1
      @second_event = create :event, id: 2

      @first_ticket = create :ticket, id: 1, event_id: @first_event.id
      @second_ticket = create :ticket, id: 2, event_id: @second_event.id
    end

    let(:different_event_ticket) do
      {
        "customer_id": '1',
        "tickets": [
          {
            "ticket_id": @first_ticket.id,
            "amount": 3
          },
          {
            "ticket_id": @second_ticket.id,
            "amount": 3
          }
        ]
      }
    end

    subject { post :create, params: { purchase: different_event_ticket } }

    it 'should return bad request when containing different event' do
      subject
      expect(response).to have_http_status :bad_request
    end
  end
end
