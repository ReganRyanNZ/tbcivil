class ProjectEntryMachine < ApplicationRecord
  belongs_to :machines
  belongs_to :project_entry
end