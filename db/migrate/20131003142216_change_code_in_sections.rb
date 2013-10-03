class ChangeCodeInSections < ActiveRecord::Migration
  def change
  	change_column :sections, :code, :string, null: true
  end
end
