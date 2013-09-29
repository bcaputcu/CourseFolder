class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.boolean :is_seen
      t.string :content

      t.timestamps
    end
  end
end
