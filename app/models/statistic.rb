class Statistic < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :tasks_created, :reminders_expired, :tasks_completed
  validates_uniqueness_of :user_id
end
