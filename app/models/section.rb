class Section < ActiveRecord::Base

	belongs_to :course

	has_many :enrollments
	has_many :users, through: :enrollments

	has_many :due_dates
	has_many :tasks, through: :due_dates

	has_many :time_slots

  validates_presence_of :code
	validates_uniqueness_of :code, scope: :course_id


end
