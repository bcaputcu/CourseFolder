class School < ActiveRecord::Base
	has_many :users
	has_many :courses
	validates_presence_of :name, :country

	def self.search search
		if search
			find(:all, conditions: ['name LIKE ?', "%#{search}%"])
		else
			[]
		end
	end
end
