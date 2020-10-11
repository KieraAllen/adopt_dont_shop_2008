# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
#
# NOTE: Images should be stored as a string as the url pointing to an externally hosted image, for example: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"

RSpec.describe "pets index page", type: :feature do
  it "can see all pets and their attributes" do
    damion = Pet.create(image: "https://blog.tutorming.com/hs-fs/hubfs/western_dragon.jpg?width=415&name=western_dragon.jpg",
                        name: "Damion",
                        approx_age: 2,
                        sex: "Male",
                        shelter_name: "Diane's Dragons")

    deirdre = Pet.create(image: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Friedrich-Johann-Justin-Bertuch_Mythical-Creature-Dragon_1806.jpg",
                        name: "Deirdre",
                        approx_age: 3,
                        sex: "Female",
                        shelter_name: "Diane's Dragons")

    charlie = Pet.create(image: "https://wizardsunitehub.info/wp-content/uploads/2019/04/ui_registry_family10_pg04_sticker01_returned.png",
                         name: "Charlie",
                         approx_age: 1,
                         sex: "Male",
                         shelter_name: "Bernie's Beasts")

    visit "/pets"

    expect(page).to have_content("Name: #{damion.name}")
    expect(page).to have_content("Approximate Age: #{damion.approx_age}")
    expect(page).to have_content("Sex: #{damion.sex}")
    expect(page).to have_content("Shelter Name: #{damion.shelter_name}")
    expect(page).to have_content("Approximate Age: #{deirdre.approx_age}")
    expect(page).to have_content("Shelter Name: #{charlie.shelter_name}")
  end
end
