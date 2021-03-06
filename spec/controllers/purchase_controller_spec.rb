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

  context 'purchase ticket with less quota' do
    before do
      @event = create :event, id: 1

      @first_ticket = create :ticket, id: 1, event_id: @event.id, quota: 10
      @second_ticket = create :ticket, id: 2, event_id: @event.id, quota: 10
    end

    let(:ticket_with_higher_amount) do
      {
        "customer_id": '1',
        "tickets": [
          {
            "ticket_id": @first_ticket.id,
            "amount": 30
          },
          {
            "ticket_id": @second_ticket.id,
            "amount": 3
          }
        ]
      }
    end

    subject { post :create, params: { purchase: ticket_with_higher_amount } }

    it 'should return bad request when having less quota' do
      subject
      expect(response).to have_http_status :bad_request
    end
  end

  context 'purchase ticket with available quota' do
    before do
      @event = create :event, id: 1
      @customer = create :customer, id: 1

      @first_ticket = create :ticket, id: 1, event_id: @event.id, quota: 10
      @second_ticket = create :ticket, id: 2, event_id: @event.id, quota: 10
    end

    let(:ticket_available_quota) do
      {
        "customer_id": @customer.id,
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

    subject { post :create, params: { purchase: ticket_available_quota } }

    it 'should return created when success making purchase' do
      subject
      expect(response).to have_http_status :created
    end
  end

  context 'purchase get specific id' do
    before do
      @purchase = create :purchase
    end

    subject { get :index, params: { id: @purchase.id } }

    it 'should return ok when success get information' do
      subject
      expect(response).to have_http_status :ok
    end
  end
end
