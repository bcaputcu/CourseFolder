class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user, index: true, null: false
      t.boolean :new_user, default: true

      t.timestamps
    end
  end
end
