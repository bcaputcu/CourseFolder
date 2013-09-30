class Flags < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :new_user
  validates_uniqueness_of :user_id

end
