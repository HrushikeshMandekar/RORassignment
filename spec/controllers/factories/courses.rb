FactoryBot.define do

  factory :course do
    sequence(:name) { |n| "Title#{n}" }
    tutors {[FactoryBot.create(:tutor), FactoryBot.create(:tutor), FactoryBot.create(:tutor)]}
  end

  factory :course_with_out_tutor, class: Course do
    sequence(:name) { |n| "Title#{n}" }
  end
end
