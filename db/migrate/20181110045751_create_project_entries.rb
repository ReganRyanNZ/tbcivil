class CreateProjectEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :project_entries do |t|
      t.string :weather
      t.string :site_condition
      t.string :location
      t.text :activity_description
      t.integer :hours_worked
      t.references :project, foreign_key: true
      t.references :entry, foreign_key: true
    end
  end
end
