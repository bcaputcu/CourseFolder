class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :section

  validates_presence_of :user_id, :section_id

  validates_uniqueness_of :user_id, scope: :section_id

end
