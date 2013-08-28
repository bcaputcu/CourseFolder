class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates_presence_of :user
  validates_presence_of :course

  validates :user_id, :uniqueness => {:scope => :course_id}

end
