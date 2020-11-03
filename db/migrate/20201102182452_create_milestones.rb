class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.references :project, null: false, foreign_key: true
      t.datetime :date, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
