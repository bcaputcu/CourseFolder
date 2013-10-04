class TimeSlot < ActiveRecord::Base
	belongs_to :section

	validates_presence_of :start_time, :end_time, :day
	
	def start_time_with_format
		start_time.strftime("%I:%M %p") if start_time
	end

	def end_time_with_format
		end_time.strftime("%I:%M %p") if end_time
	end

	def day_s

		case day
		when 0
			'Sunday'
		when 1
			'Monday'
		when 2
			'Tuesday'
		when 3
			'Wednesday'
		when 4
			'Thursday'
		when 5
			'Friday'
		when 6
			'Saturday'
		else
			'Unknown'
		end

	end

	def self.days_collection
		[
			OpenStruct.new({ label: 'Sun', value: 0}),
			OpenStruct.new({ label: 'Mon', value: 1}),
			OpenStruct.new({ label: 'Tue', value: 2}),
			OpenStruct.new({ label: 'Wed', value: 3}),
			OpenStruct.new({ label: 'Thu', value: 4}),
			OpenStruct.new({ label: 'Fri', value: 5}),
			OpenStruct.new({ label: 'Sat', value: 6})
		]
	end
	
end
