require 'rails_helper'

feature "User can see closest stations" do
  scenario "" do
    VCR.user_casseette("closest_stations")


      # As a user
      # When I visit "/"
      visit "/"
      # And I fill in the search form with 80203
      fill_in "Search by zip...", with "80203"
      # And I click "Locate"
      click_button "Locate"
      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to have_content("/search")  #had to look this one up!
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_content("10 Closest Stations")
        # within_css do
        # => count some repeated CSS element
        # end
      # And the stations should be limited to Electric and Propane
      expect(page).to_not have_content("BD")
      expect(page).to_not have_content("CNG")
      expect(page).to_not have_content("E85")
      expect(page).to_not have_content("HY")
      expect(page).to_not have_content("LNG")

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times


    end #end vcr
  end
end


# https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?&location=80203&radius&limit=10
