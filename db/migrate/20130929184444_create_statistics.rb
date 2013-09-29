class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.references :user, index: true, null: false
      t.integer :tasks_created, default: 0
      t.integer :reminders_expired, default: 0
      t.integer :tasks_completed, default: 0

      t.timestamps
    end
  end
end
