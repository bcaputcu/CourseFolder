class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.string :category
      t.text :description
      t.references :course, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    add_index :tasks, [:course_id, :user_id]
  end
end
