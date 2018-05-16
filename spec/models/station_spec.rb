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
    expect(station.access_times).to eq(station_data[:access_times])
  end

  it 'should be able to load a collection of stations' do
    stations_json = File.read('./spec/fixtures/stations.json')
    stations_json = JSON.parse(stations_json, symbolize_names: true)

    stations = Station::from_list(stations_json)

    expect(stations.length).to be(2)
    stations.each do |station|
      expect(station).to be_a Station
    end

    station = stations.first

    expect(station.name).to eq(stations_json.first[:station_name])
    expect(station.address).to eq(stations_json.first[:street_address])
    expect(station.fuel_types).to eq(stations_json.first[:fuel_type_code])
    expect(station.distance).to eq(stations_json.first[:distance])
    expect(station.access_times).to eq(stations_json.first[:access_days_time])
  end
end
