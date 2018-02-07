class SearchController < ApplicationController

  def index
    # @stations = Station.method_to_call_api(params[:q])

    connection = Faraday.new("https://api.data.gov/") do |f|
      f.headers['X-Api-Key'] = ENV['API_USER_TOKEN']
      f.adapter Faraday.default_adapter
    end

      response = connection.get("nrel/alt-fuel-stations/v1/nearest.json?&location=80203&radius=6.0&fuel_type=ELEC,LPG&limit=10")

      @stations = Station.new(JSON.parse(response.body, symbolize_names: true)[fuel_stations])

      #NEXT STEP - create a model that takes in the response and creates instances
    end

  end
