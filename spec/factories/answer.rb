FactoryGirl.define do
  factory :answer do
    answer          { Faker::Hipster.sentence              }
    trivia_question { FactoryGirl.create(:trivia_question) }
    user            { FactoryGirl.create(:user)            }
  end
end
