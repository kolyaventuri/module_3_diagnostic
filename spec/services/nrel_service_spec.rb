require 'rails_helper'

describe NRELService do
  it 'should be able to make API requests' do
    VCR.use_cassette('nrel_api_test') do
      response = NRELService::make_request('/alt-fuel-stations/v1.json', {limit: 1})

      expect(response[:fuel_stations]).to be_an Array
    end
  end
end
