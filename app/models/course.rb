class Course < ActiveRecord::Base

	belongs_to :school
	has_many :sections, dependent: :destroy
	has_many :tasks, dependent: :destroy

	validates_presence_of :school_id, :code
	validates_uniqueness_of :code, scope: :school_id

	after_create :create_default_section

	accepts_nested_attributes_for :sections, allow_destroy: true
	
	validates :sections, :nested_attributes_uniqueness => {:field => :code}

	def upcoming_tasks
		tasks.where(start_date: Time.now.beginning_of_day .. 1.week.from_now)
	end

	def create_default_section
		sections.create(code: "default")
	end
end
