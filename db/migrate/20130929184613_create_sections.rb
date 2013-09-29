class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :course, index: true, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end
