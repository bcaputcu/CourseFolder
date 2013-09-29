class CreateDueDates < ActiveRecord::Migration
  def change
    create_table :due_dates do |t|
      t.references :section, index: true, null: false
      t.references :task, index: true, null: false
      t.datetime :expiry_datetime, null: false

      t.timestamps
    end
    add_index :due_dates, [:task_id, :section_id], unique: true
  end
end
