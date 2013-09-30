class TimeSlot < ActiveRecord::Base
  belongs_to :section

	validates_presence_of :section_id, :star_time, :end_time, :day

end
