class CreateSchoolsUsers < ActiveRecord::Migration
  def change
    create_table :schools_users do |t|
      t.references :school, index: true, null: false
      t.references :user, index: true, null: false
    end
    add_index :schools_users, [:school_id, :user_id], unique: true
  end
end
