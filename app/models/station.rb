class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(opts)
    @name = opts[:name]
    @address = opts[:address]
    @fuel_types = opts[:fuel_types]
    @distance = opts[:distance]
    @access_times = opts[:access_times]
  end

  def self.from_list(stations)
    stations.map do |station|
      new(
        name: station[:station_name],
        address: station[:street_address],
        fuel_types: station[:fuel_type_code],
        distance: station[:distance],
        access_times: station[:access_days_time]
      )
    end
  end
end
