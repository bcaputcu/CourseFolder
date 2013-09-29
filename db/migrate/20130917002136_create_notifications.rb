class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.string :content
      t.string :link
      t.string :icon
      t.boolean :is_seen

      t.timestamps
    end
  end
end
