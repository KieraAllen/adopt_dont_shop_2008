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

# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info

require 'rails_helper'

RSpec.describe "shelter's show page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name: "T Diane's Dragons",
                               address: "T 1241 W Bayaud Ave",
                               city: "T Denver",
                               state: "T CO",
                               zip: "T 80223"
                               )

    @shelter_2 = Shelter.create(name: "T Bernie's Beasts",
                               address: "T 1005 Galapago St",
                               city: "T Denver",
                               state: "T CO",
                               zip: "T 80204"
                               )

    visit "/shelters/#{@shelter_1.id}"
  end

  it "can see specific shelter info" do

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)
    expect(page).not_to have_content(@shelter_2.name)
  end

  it "can click link 'Update Shelter' and visit that shelter's edit page" do

    expect(page).to have_link('Update Shelter')

    click_link ('Update Shelter')

    expect(current_path).to eq ("/shelters/#{@shelter_1.id}/edit")
  end
end
