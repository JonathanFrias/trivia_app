FactoryGirl.define do
  factory :trivia_question do
    sequence(:question) { |i| "question#{i}" }
    user_id { FactoryGirl.create(:user).id }
  end
end
