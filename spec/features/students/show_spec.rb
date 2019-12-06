require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a student's show page" do
    it "I see a list of that student's courses" do
      data = Course.create!(name: "Defense Against the Dark Arts")
      herbology = Course.create!(name: "Herbology")
      potions = Course.create!(name: "Potions")
      casseopia = Student.create!(name: "Casseopia Black",
                                 age: "14",
                                 house: "Slytherin")
      ron = Student.create!(name: "Ron Weasley",
                                     age: "13",
                                     house: "Gryffindor")
      potions_course = StudentCourse.create!(course_id: potions.id,
                                             student_id: ron.id)
      herbology_course = StudentCourse.create!(course_id: herbology.id,
                                              student_id: ron.id)
      potions_course = StudentCourse.create!(course_id: potions.id,
                                             student_id: casseopia.id)



      visit "/students/#{ron.id}"


      expect(page).to have_content(potions.name)
      expect(page).to have_content(herbology.name)
    end
  end
end
