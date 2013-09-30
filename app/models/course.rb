class Course < ActiveRecord::Base

	belongs_to :school
	has_many :sections
	has_many :tasks

	validates_presence_of :school_id, :code
	validates_uniqueness_of :code, scope: :school_id

	def upcoming_tasks
		tasks.where(start_date: Time.now.beginning_of_day .. 1.week.from_now)
	end
end
