class CreateProjectEntryMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :project_entry_machines do |t|
      t.references :machine, foreign_key: true
      t.references :project_entry, foreign_key: true
      t.integer :start_hours
      t.integer :finish_hours
    end
  end
end
