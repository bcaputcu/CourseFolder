class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :school, index: true, null: false
      t.string :name, null: false
      t.string :code, null: false
      t.string :instructor_name

      t.timestamps
    end
  end
end
