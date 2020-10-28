class AddUniqueIndexToPins < ActiveRecord::Migration[6.0]
  def change
    add_index :pins, [:user_id, :project_id], unique: true, name: 'index_unique_pins_on_user_id_and_project_id'
  end
end
