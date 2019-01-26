class Project < ApplicationRecord

  has_many :project_entries, inverse_of: :project # test whether inverse is necessary
  has_many :entries, through: :project_entries
  has_many :project_codes
end