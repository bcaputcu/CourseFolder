class DueDate < ActiveRecord::Base
  belongs_to :section
  belongs_to :task

	validates_presence_of :section_id, :expiry_datetime
	validates_uniqueness_of :section_id, scope: :task_id

end
