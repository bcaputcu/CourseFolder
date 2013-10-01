class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments, dependent: :destroy
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

  def enroll! course
  	enrollments.create!(course_id: course.id)
  end

  def drop! course
  	enrollments.find_by_course_id(course.id).destroy
  end

  def enrolled? course
  	!enrollments.find_by_course_id(course.id).blank?
  end

  def upcoming_tasks
  	tasks = []
  	courses.each do |course|
  		tasks += course.upcoming_tasks
  	end
  	tasks.sort_by &:start_date
  end

  def hook_tables
    Flag.create user: self
    Setting.create user: self
    Statistic.create user: self
  end

  def enroll_school school_id
    school = School.find_by_id school_id
    if school
      self.school = school
      self.flag.update!(new_user: :false)
    end
  end

end
