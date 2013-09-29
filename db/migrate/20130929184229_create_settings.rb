class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :user, index: true, null: false
      t.integer :default_reminder_seconds, default: 3.days.seconds.to_i
      t.boolean :notify_new_tasks, default: true
      t.boolean :notify_new_tasks_without_due_date, default: true

      t.timestamps
    end
  end
end
