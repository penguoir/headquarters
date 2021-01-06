class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.datetime :due
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
