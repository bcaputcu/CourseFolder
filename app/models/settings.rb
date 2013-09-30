class Settings < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :default_reminder_time, :notify_new_tasks, :notify_new_tasks_without_due_date
  validates_uniqueness_of :user_id
end
