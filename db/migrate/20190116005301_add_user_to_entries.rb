class AddUserToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :user, foreign_key: true
  end
end
