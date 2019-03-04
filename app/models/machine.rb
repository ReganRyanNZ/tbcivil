class Machine < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :team_id, presence: true
end