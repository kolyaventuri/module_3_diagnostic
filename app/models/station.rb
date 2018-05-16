class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(opts)
    @name = opts[:name]
    @address = opts[:address]
    @fuel_types = opts[:fuel_types]
    @distance = opts[:distance]
    @access_times = opts[:access_times]
  end
end
