FactoryBot.define do
  factory :entry do
    started_at { "8:30am 29th June 2019".to_time }
    finished_at { "5:30pm 29th June 2019".to_time }
    break_minutes { 30 }
    weather { "cloudy" }
    user
  end
end
