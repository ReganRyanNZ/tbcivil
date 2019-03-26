FactoryBot.define do
  factory :project_entry_material do
    quantity { 5.5 }
    project_entry
    material
  end
end
