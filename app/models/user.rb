class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments, dependent: :destroy do
    def for_course (course)
      where(section_id: course.sections.pluck(:id) )
    end
  end

  has_many :sections, through: :enrollments
  has_many :courses, through: :sections

  belongs_to :school

  has_one :flag, dependent: :destroy
  has_one :setting, dependent: :destroy
  has_one :statistic, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_many :reminders, dependent: :destroy
  has_many :tasks, through: :reminders

  has_many :owned_tasks, class_name: 'Task', foreign_key: 'owner_id'

  def enroll! section
  	enrollments.create!(section_id: section.id)
  end

  def drop! section
  	enrollments.find_by_section_id(section.id).destroy
  end

  def enrolled? section
  	!enrollments.find_by_section_id(section.id).blank?
  end

  def enrolled_to_course? course
    courses.include? course
  end

  def upcoming_tasks
  	tasks = []
  	courses.each do |course|
  		tasks += course.upcoming_tasks
  	end
  	tasks
  end

  def hook_tables
    Flag.create user: self
    Setting.create user: self
    Statistic.create user: self
  end

  def enroll_school school_id
    school = School.find_by_id school_id
    if school
      school.users << self
      self.flag.update!(new_user: :false)
    end

    school
  end

end
