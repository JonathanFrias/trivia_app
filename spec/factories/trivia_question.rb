FactoryGirl.define do
  factory :trivia_question do
    sequence(:question) { |i| "question#{i}" }
    user                { FactoryGirl.create(:user) }
    correct_answer      { Faker::Hacker.say_something_smart }
  end
end
