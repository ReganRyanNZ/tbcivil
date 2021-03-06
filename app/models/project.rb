class Project < ApplicationRecord
  belongs_to :team
  has_many :project_entries, inverse_of: :project # test whether inverse is necessary
  has_many :entries, through: :project_entries
  has_many :project_codes

  validates :name, presence: true
end