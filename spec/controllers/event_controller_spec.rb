require 'rails_helper'

RSpec.describe EventController, type: :controller do
  context 'create invalid params' do
    let(:invalid_param) do
      {
        "name": 'Event A',
        "organizer": 'Organizer A',
        "capacity": 50,
        "start_date": '2013-02-02 01:00:00',
        "end_date": '2013-02-02 01:00:00'
      }
    end

    subject { post :create, params: { event: invalid_param } }

    it 'should return bad request when having incomplete params' do
      subject
      expect(response).to have_http_status :bad_request
    end
  end

  context 'create wrong format params' do
    before do
      @location = create :location
    end

    let(:wrong_format_param) do
      {
        "name": 'Event A',
        "organizer": 'Organizer A',
        "capacity": 50,
        "start_date": 'wrong date',
        "end_date": '2013-02-02 01:00:00',
        "location_id": @location.id
      }
    end

    subject { post :create, params: { event: wrong_format_param } }

    it 'should return bad request when having wrong format param' do
      subject
      expect(response).to have_http_status :bad_request
    end
  end

  context 'create with valid params' do
    before do
      @location = create :location
    end

    let(:valid_param) do
      {
        "name": 'Event A',
        "organizer": 'Organizer A',
        "capacity": 50,
        "start_date": '2013-02-02 01:00:00',
        "end_date": '2013-02-02 01:00:00',
        "location_id": @location.id
      }
    end

    subject { post :create, params: { event: valid_param } }

    it 'should return bad request when having wrong format param' do
      subject
      expect(response).to have_http_status :created
    end
  end
end
