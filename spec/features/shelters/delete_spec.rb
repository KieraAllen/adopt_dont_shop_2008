require 'rails_helper'

RSpec.describe "shelter's delete button", type: :feature do
  before do
    Shelter.delete_all
  end

  it "can delete shelter with link 'Delete Shelter' and redirect to index page" do
    shelter_1 = Shelter.create(name: "T Diane's Dragons",
                               address: "T 1241 W Bayaud Ave",
                               city: "T Denver",
                               state: "T CO",
                               zip: "T 80223"
                               )

    visit "/shelters/#{shelter_1.id}"

    click_button 'Delete Shelter'

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter_1.name)
  end
end
