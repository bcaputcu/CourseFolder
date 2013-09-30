class Task < ActiveRecord::Base
	belongs_to :course
	belongs_to :owner, class_name: "User"

	validates_presence_of :owner_id, :course_id, :name, :category


end
