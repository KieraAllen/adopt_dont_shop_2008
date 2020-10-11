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
