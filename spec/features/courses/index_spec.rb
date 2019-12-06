require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the course index page" do
    it "I see a list of courses and the number of students enrolled in each course" do
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

      visit "/courses"

      expect(page).to have_content("Potions: 2")
      expect(page).to have_content("Herbology: 1")
    end
  end
end
