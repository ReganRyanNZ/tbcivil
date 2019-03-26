class Material < ApplicationRecord
  belongs_to :team

  monetize :current_rate_cents
  validates_presence_of :name
  validates_presence_of :unit
  validates_presence_of :tons_per_m3
  validates_presence_of :current_rate_cents
  validates_presence_of :currency
  validates :team_id, presence: true

end
