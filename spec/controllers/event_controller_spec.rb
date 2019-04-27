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
end
