class AddParentEmailColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :parent_email, :string
  end
end
