class Course < ActiveRecord::Base

	belongs_to :school
	has_many :sections, dependent: :destroy
	has_many :tasks, dependent: :destroy

	has_many :enrollments, through: :sections

	validates_presence_of :school_id, :code
	validates_uniqueness_of :code, scope: :school_id

	accepts_nested_attributes_for :sections, :reject_if => :all_blank, allow_destroy: true

	validates :sections, :nested_attributes_uniqueness => {:field => :code}

	def upcoming_tasks
		tasks.where(start_date: Time.now.beginning_of_day .. 1.week.from_now)
	end

	def sections_enabled?
		sections.count > 1
	end

	def create_default_section
		sections.new
	end

	def disable_sections
		sections.drop(1).each do |section|
			section.destroy
		end
	end

end
