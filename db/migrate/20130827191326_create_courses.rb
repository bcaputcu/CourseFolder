class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :instructor
      t.string :name, null: false, unique: true
      t.string :school

      t.timestamps
    end
  end
end
