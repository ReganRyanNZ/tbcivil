class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
    end

    add_reference :users, :team, foreign_key: true
    add_reference :projects, :team, foreign_key: true
    add_reference :machines, :team, foreign_key: true
    add_reference :project_entries, :team, foreign_key: true
  end
end
