class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, index: true, null: false
      t.references :section, index: true, null: false

      t.timestamps
    end
    add_index :enrollments, [:user_id, :section_id], unique: true
  end
end
