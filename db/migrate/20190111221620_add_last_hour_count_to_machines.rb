class AddLastHourCountToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :last_hour_count, :integer, default: 0
  end
end
