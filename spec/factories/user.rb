FactoryGirl.define do
  factory :user, class: "User" do
    sequence(:username, 1) { |i| "user#{i}" }
    sequence(:email)       { |i| "email#{i}@foo.bar" }
    password               { username }
    score                  { 0 }
  end
end
