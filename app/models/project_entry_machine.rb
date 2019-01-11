class ProjectEntryMachine < ApplicationRecord
  belongs_to :machine
  belongs_to :project_entry
end