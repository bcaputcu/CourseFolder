class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :course, index: true
      t.references :author, index: true, null: false
      t.string :title, null: false
      t.string :description
      t.references :forked_from, index: true

      t.timestamps
    end
  end
end
