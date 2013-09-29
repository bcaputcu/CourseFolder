class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.references :section, index: true, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :day, null: false

      t.timestamps
    end
  end
end
