class School < ActiveRecord::Base
	has_many :users
	validates_presence_of :name, :country

	def self.search search
		if search
			find(:all, conditions: ['name LIKE ?', "%#{search}%"])
		else
			[]
		end
	end
end
