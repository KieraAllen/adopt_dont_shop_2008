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

RSpec.describe "shelter's edit page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name: "T Diane's Dragons")

    visit "/shelters/#{@shelter_1.id}/edit"
  end

  it "can see a form to edit shelter's data" do

    fill_in :name, with: "T Deedee's Dragons"
    fill_in :address, with: "T 1241 W Bayaud Ave"
    fill_in :city, with: "T Denver"
    fill_in :state, with: "T CO"
    fill_in :zip, with: "T 80223"

    click_on 'Update'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")

    expect(page).to have_content("T Deedee's Dragons")
  end
end
