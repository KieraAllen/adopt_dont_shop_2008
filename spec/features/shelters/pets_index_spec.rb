# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex

# User Story 10, Shelter Pet Creation
#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed

RSpec.describe "shelter pets index page" do
  it "can see each adoptable pet on a specific shelter's pet index page" do

    dianes_dragons = Shelter.create(name: "Diane's Dragons",
                               address: "1241 W Bayaud Ave",
                               city: "Denver",
                               state: "CO",
                               zip: "80223"
                               )

    bernies_beasts = Shelter.create(name: "Bernie's Beasts",
                               address: "1005 Galapago St",
                               city: "Denver",
                               state: "CO",
                               zip: "80204"
                               )

    damion = Pet.create!(image: "https://blog.tutorming.com/hs-fs/hubfs/western_dragon.jpg?width=415&name=western_dragon.jpg",
                         name: "Damion",
                         approx_age: 2,
                         sex: "Male",
                         shelter_id: dianes_dragons.id
                         )

    deirdre = Pet.create!(image: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Friedrich-Johann-Justin-Bertuch_Mythical-Creature-Dragon_1806.jpg",
                          name: "Deirdre",
                          approx_age: 3,
                          sex: "Female",
                          shelter_id: dianes_dragons.id
                          )

    charlie = Pet.create!(image: "https://wizardsunitehub.info/wp-content/uploads/2019/04/ui_registry_family10_pg04_sticker01_returned.png",
                          name: "Charlie",
                          approx_age: 1,
                          sex: "Male",
                          shelter_id: bernies_beasts.id
                          )

    visit "/shelters/#{dianes_dragons.id}/pets"

    expect(page).to have_content("Name: Damion")
    expect(page).to have_content("Approximate Age: #{damion.approx_age}")
    expect(page).to have_content("Sex: #{damion.sex}")
    expect(page).to have_content(damion.image)
    expect(page).to have_content("Name: Deirdre")
    expect(page).to have_content("Approximate Age: #{deirdre.approx_age}")
    expect(page).to have_content("Sex: #{deirdre.sex}")
    expect(page).to have_content(deirdre.image)
    expect(page).to_not have_content("Name: Charlie")
    expect(page).to_not have_content("Approximate Age: #{charlie.approx_age}")
  end

  it "can go to new pet creation page using Create Pet link" do
    bernies_beasts = Shelter.create(name: "Bernie's Beasts",
                                    address: "1005 Galapago St",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80204"
                                    )

    visit "/shelters/#{bernies_beasts.id}/pets"

    click_link "Create Pet"

    expect(current_path).to  eq("/shelters/#{bernies_beasts.id}/pets/new")
  end
end
