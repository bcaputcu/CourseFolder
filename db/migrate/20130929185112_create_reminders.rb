class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :task, index: true, null: false
      t.references :user, index: true, null: false
      t.datetime :expiry_datetime, null: false

      t.timestamps
    end
    add_index :reminders, [:task_id, :user_id]
  end
end
