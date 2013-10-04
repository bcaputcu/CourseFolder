class Section < ActiveRecord::Base

	belongs_to :course

	has_many :enrollments, dependent: :destroy
	has_many :users, through: :enrollments

	has_many :due_dates, dependent: :destroy
	has_many :tasks, through: :due_dates

	has_many :time_slots, dependent: :destroy

  validates_presence_of :course_id
	validates_uniqueness_of :code, scope: :course_id

	accepts_nested_attributes_for :time_slots, :reject_if => :all_blank, allow_destroy: true

end
