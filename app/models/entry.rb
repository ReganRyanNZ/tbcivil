

class Entry < ApplicationRecord

  belongs_to :user
  has_many :project_entries
  has_many :projects, through: :project_entries


  def started_at_time
    started_at&.to_formatted_s(:time)
  end

  def finished_at_time
    finished_at&.to_formatted_s(:time)
  end
end