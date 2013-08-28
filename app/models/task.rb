class Task < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	validates_presence_of :user
	validates_presence_of :course
	validates_presence_of :name
	validates_presence_of :start_date
end
