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
