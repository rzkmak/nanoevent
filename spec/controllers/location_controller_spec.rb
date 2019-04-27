require 'rails_helper'

RSpec.describe LocationController, type: :controller do
  context 'invalid params' do
    let(:invalid_param) do
      {
        "name": '',
        "address": 'Kebayoran Baru',
        "city": 'Jaksel',
        "longitude": '0.0',
        "latitude": '0.0',
        "created_at": '2019-04-27T13:44:10.463Z',
        "updated_at": '2019-04-27T13:44:10.463Z'
      }
    end

    subject { post :create, params: { location: invalid_param } }

    it 'should return bad request when having incomplete params' do
      subject
      expect(response).to have_http_status :bad_request
    end
  end

  context 'valid params' do
    let(:valid_param) do
      {
        "name": 'Jalan Bangka',
        "address": 'Kebayoran Baru',
        "city": 'Jaksel',
        "longitude": '0.0',
        "latitude": '0.0',
        "created_at": '2019-04-27T13:44:10.463Z',
        "updated_at": '2019-04-27T13:44:10.463Z'
      }
    end

    subject { post :create, params: { location: valid_param } }

    it 'should return status created when having complete params' do
      subject
      expect(response).to have_http_status :created
    end
  end
end
