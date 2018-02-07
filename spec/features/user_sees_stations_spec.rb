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
      expect(page).to have_content("10 closest Stations")
      within_css do

      end
      # And the stations should be limited to Electric and Propane

      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times


    end #end vcr
  end
end
