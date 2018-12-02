class ProjectEntry < ApplicationRecord

  belongs_to :entry
  belongs_to :project

  has_many :machines, through: :project_entry_machines
end