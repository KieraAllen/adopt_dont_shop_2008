# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status

RSpec.describe "pet's show page", type: :feature do
  it "can see specific pet's info" do

    dianes_dragons = Shelter.create(name: "Diane's Dragons",
                               address: "1241 W Bayaud Ave",
                               city: "Denver",
                               state: "CO",
                               zip: "80223"
                               )

    damion = Pet.create(image: "https://blog.tutorming.com/hs-fs/hubfs/western_dragon.jpg?width=415&name=western_dragon.jpg",
                        name: "Damion",
                        description: "Damion is wild!",\
                        approx_age: 2,
                        sex: "Male",
                        status: "Adoptable",
                        shelter_id: dianes_dragons.id
                        )



    visit "/pets/#{damion.id}"

    expect(page).to have_content("Name: Damion")
    expect(page).to have_content("Approximate Age: #{damion.approx_age}")
    expect(page).to have_content("Sex: #{damion.sex}")
    expect(page).to have_content(damion.image)
    expect(page).to have_content("Description: #{damion.description}")
    expect(page).to have_content("Adoption Status: #{damion.status}")
  end
end
