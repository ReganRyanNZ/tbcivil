class MoveWeatherFromProjectEntriesToEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_entries, :weather
    add_column :entries, :weather, :string
  end
end
