class Task < ActiveRecord::Base
	belongs_to :course
	belongs_to :owner, class_name: "User"

	has_many :reminders, dependent: :destroy
	has_many :users, through: :reminders

	has_many :due_dates, dependent: :destroy
	has_many :sections, through: :due_dates

	validates_presence_of :owner_id, :course_id, :name, :category

	before_save :downcase_category

	accepts_nested_attributes_for :due_dates, :reject_if => :all_blank, allow_destroy: true

	def downcase_category
		category.downcase!
	end

end
