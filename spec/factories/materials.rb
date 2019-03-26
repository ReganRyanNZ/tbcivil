FactoryBot.define do
  factory :material do
    name { "test material" }
    current_rate_cents { 0 }
    currency { "AUD" }
    unit { "tons" }
    tons_per_m3 { 1.9 }
    team
  end
end
