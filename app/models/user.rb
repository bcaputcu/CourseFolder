class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments
  has_many :sections, through: :enrollments
  has_many :courses, through: :sections

  belongs_to :school

  has_many :notifications

  has_many :reminders
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
end
