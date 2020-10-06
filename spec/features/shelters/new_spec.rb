# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
#
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.

require 'rails_helper'

RSpec.describe "new shelter", type: :feature do
  describe "when a visitor clicks 'New Shelter' link on shelter index page" do
    it "can create a new shelter after filling out form" do

      visit "/shelters"

      click_link 'New Shelter'

      expect(current_path).to eq("/shelters/new")

      fill_in "Name", with: "T Cindy's Centaurs"
      fill_in "Address", with: "T 1241 W Bayaud Ave"
      fill_in "City", with: "T Denver"
      fill_in "State", with: "T CO"
      fill_in "Zip", with: "T 80223"

      click_on 'Create Shelter'

      expect(current_path).to eq("/shelters")
      expect(page).to have_content("T Cindy's Centaurs")
    end
  end
end
