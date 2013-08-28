class Course < ActiveRecord::Base
	has_many :enrollments
	has_many :users, through: :enrollments

	has_many :tasks

	validates_presence_of :name
	validates_uniqueness_of :name

	def upcoming_tasks
		tasks.where(start_date: Time.now.beginning_of_day .. 1.week.from_now)
	end
end
