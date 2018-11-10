class CreateMachineJobEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_job_entries do |t|
      t.references :machine, foreign_key: true
      t.references :job_entry, foreign_key: true
      t.integer :start_hours
      t.integer :finish_hours
    end
  end
end
