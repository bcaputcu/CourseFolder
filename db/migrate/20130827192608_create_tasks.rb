class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :owner, index: true, null: false
      t.references :course, index: true, null: false
      t.string :category
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
    add_index :tasks, [:course_id, :owner_id]
  end
end
