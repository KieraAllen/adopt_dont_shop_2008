# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system

require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters' names" do
    shelter_1 = Shelter.create(name: "T Diane's Dragons",
                               address: "T 1241 W Bayaud Ave",
                               city: "T Denver",
                               state: "T CO",
                               zip: "T 80223"
                               )

    shelter_2 = Shelter.create(name: "T Bernie's Beasts",
                               address: "T 1005 Galapago St",
                               city: "T Denver",
                               state: "T CO",
                               zip: "T 80204"
                               )

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page).not_to have_content(shelter_2.state)
  end
end
