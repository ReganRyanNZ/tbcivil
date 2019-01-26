class CreateProjectCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :project_codes do |t|
      t.string :name
      t.references :project, foreign_key: true
    end
  end
end
