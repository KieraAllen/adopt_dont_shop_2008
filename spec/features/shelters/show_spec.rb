# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip

require 'rails_helper'

RSpec.describe "shelter's show page", type: :feature do
  it "can see specific shelter info" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).not_to have_content(shelter_2.name)
  end
end
