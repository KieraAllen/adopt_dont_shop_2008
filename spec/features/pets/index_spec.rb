RSpec.describe "pets index page", type: :feature do
  it "can see all pets and their attributes" do
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
                         shelter_id: bernies_beasts.id)

    visit "/pets"

    expect(page).to have_content("Name: Damion")
    expect(page).to have_content("Approximate Age: #{damion.approx_age}")
    expect(page).to have_content("Sex: #{damion.sex}")
    expect(page).to have_content("Approximate Age: #{deirdre.approx_age}")
    expect(page).to have_content("Shelter: #{bernies_beasts.name}")
  end
end
