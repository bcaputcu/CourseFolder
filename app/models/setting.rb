class Setting < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :default_reminder_seconds, :notify_new_tasks, :notify_new_tasks_without_due_date
  validates_uniqueness_of :user_id
end
