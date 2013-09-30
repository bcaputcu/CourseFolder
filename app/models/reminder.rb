class Reminder < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates_presence_of :task_id, :user_id, :expiry_datetime

end
