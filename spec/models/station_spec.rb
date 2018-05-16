require 'rails_helper'

describe Station do
  let(:station_data) do
    {
      name: 'Bob',
      address: '123 Main',
      fuel_types: 'ELEC',
      distance: 6.0,
      access_times: '24 hours'
    }
  end

  it 'should be able to represent a station' do
    station = Station.new(station_data)

    expect(station.name).to eq(station_data[:name])
    expect(station.address).to eq(station_data[:address])
    expect(station.fuel_types).to eq(station_data[:fuel_types])
    expect(station.distance).to eq(station_data[:distance])
    expect(station.name.access_times).to eq(station_data[:access_times])
  end
end
