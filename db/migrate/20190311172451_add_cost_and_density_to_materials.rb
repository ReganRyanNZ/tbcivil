class AddCostAndDensityToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :current_rate_cents, :integer #, limit: 8   add this if avlues start going above 21 million
    add_column :materials, :currency, :string
    add_column :materials, :tons_per_m3, :decimal, precision: 6, scale: 6
  end
end
