class ProjectEntryMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :project_entry
end