class AddProjectCodeToProjectEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_entries, :project_code, foreign_key: true
  end
end
