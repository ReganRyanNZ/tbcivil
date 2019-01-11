##
# A ProjectEntry is entry data specific to a project

class ProjectEntry < ApplicationRecord

  belongs_to :entry
  belongs_to :project

  has_many :project_entry_machines, inverse_of: :project_entry
  has_many :machines, through: :project_entry_machines
  accepts_nested_attributes_for :project_entry_machines, reject_if: :all_blank, allow_destroy: true

  has_many :project_entry_materials, inverse_of: :project_entry
  has_many :materials, through: :project_entry_materials
  accepts_nested_attributes_for :project_entry_materials, reject_if: :all_blank, allow_destroy: true

end