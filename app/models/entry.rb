##
# An Entry is a worker's day of work, which could span multiple projects

class Entry < ApplicationRecord

  belongs_to :user
  has_many :project_entries
  has_many :projects, through: :project_entries
  accepts_nested_attributes_for :project_entries, reject_if: :all_blank, allow_destroy: true

  validates :break_minutes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  def started_at_time
    started_at&.to_formatted_s(:time)
  end

  def finished_at_time
    finished_at&.to_formatted_s(:time)
  end
end