class AddPinnedColumnToPins < ActiveRecord::Migration[6.0]
  def change
    add_column :pins, :pinned, :boolean, default: true, null: false
  end
end
