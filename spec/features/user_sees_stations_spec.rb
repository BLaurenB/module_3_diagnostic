  require 'rails_helper'

feature "User can see closest stations" do
  scenario "it returns a list limited by radius, fuel_type" do
    VCR.use_cassette("closest_stations") do

      visit "/"
      # And I fill in the search form with 80203
      fill_in :q, with: "80203"
      # And I click "Locate"
      click_on "Locate"
      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to have_content("/search")  #had to look this one up!
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_content("10 Closest Stations")
      expect(page).to have_css(".station", count: 7)  #had to look this up

      # And the stations should be limited to Electric and Propane
      expect(page).to_not have_content("BD")
      expect(page).to_not have_content("CNG")
      expect(page).to_not have_content("E85")
      expect(page).to_not have_content("HY")
      expect(page).to_not have_content("LNG")

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

      within(first(".station")) do  #had to look this up
        expect(page).to have_css(".name")
        expect(page).to have_css(".address")
        expect(page).to have_css(".fuel_type")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".access_time")
      end

    end #end vcr
  end
end


# https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?&location=80203&radius=6.0&fuel_type=ELEC,LPG&limit=10
