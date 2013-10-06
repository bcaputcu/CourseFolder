class DueDate < ActiveRecord::Base
	belongs_to :section
	belongs_to :task

	validates_presence_of :section_id, :expiry_datetime
	validates_uniqueness_of :section_id, scope: :task_id

	def self.events_for_sections(section_ids)
		result_array = DueDate.where(section_id: section_ids).map do |dd|
			{
				id: dd.id,
				title: dd.task.name,
				start: dd.expiry_datetime.to_i*1000,
				:"end" => dd.expiry_datetime.to_i*1000
			}
		end
		
		{
			success: 1,
			result: result_array
		}
	end

end
