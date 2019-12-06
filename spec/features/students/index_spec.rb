require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the students index page" do
    before(:each) do
      @casseopia = Student.create!(name: "Casseopia Black",
                                 age: "14",
                                 house: "Slytherin")
      @ron = Student.create!(name: "Ron Weasley",
                                 age: "13",
                                 house: "Gryffindor")
    end

    it "I see a list of students including their
        -name
        -age
        -house" do

        visit "/students"

        expect(page).to have_content(@casseopia.name)
        expect(page).to have_content(@casseopia.age)
        expect(page).to have_content(@casseopia.house)

        expect(page).to have_content(@ron.name)
        expect(page).to have_content(@ron.age)
        expect(page).to have_content(@ron.house)
    end
  end
end
