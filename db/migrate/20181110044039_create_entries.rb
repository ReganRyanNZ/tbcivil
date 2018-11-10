class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :break_minutes
    end
  end
end
