

class Entry < ApplicationRecord

  def started_at_time
    started_at&.to_formatted_s(:time)
  end

  def finished_at_time
    finished_at&.to_formatted_s(:time)
  end
end