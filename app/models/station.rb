class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_time

  def initialize(station)
    @name = station[:id]
    @street_address = station[:street_address]
    # @address = station[:address]
    # @address = station[:address]
    # @address = station[:address]
    @fuel_type = station[:fuel_type_code]
    @distance = station[:distance]
    @access_time = station[:access_days_time]
  end

def address
  #Need to decorate for the full adddress
end



end
