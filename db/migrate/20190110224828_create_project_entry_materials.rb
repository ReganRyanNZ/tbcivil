class CreateProjectEntryMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :project_entry_materials do |t|
      t.references :project_entry, foreign_key: true
      t.references :material, foreign_key: true

      t.decimal :quantity, precision: 10, scale: 2
      t.string :truck_size

    end
  end
end
