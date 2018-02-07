class SearchController < ApplicationController

  def index
    # @stations = Station.method_to_call_api(params[:q])
    @stations = JSON.parse(response.fuel_stations, symbolize_names: true)

    connection = Faraday.new("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?&location=80203") do |f|
      f.headers['X-Api-Key'] = ENV['API_USER_TOKEN']
      f.adapter Faraday.default_adapter
    end

      response = connection.get("&radius=6.0&fuel_type=ELEC,LPG&limit=10")

    end

  end
