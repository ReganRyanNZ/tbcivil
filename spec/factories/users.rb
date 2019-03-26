FactoryBot.define do
  factory :user do
    first_name { "Test" }
    last_name { "Guy" }
    email { "testguy@example.com" }
    password { "testpassword" }
    team
  end
end
