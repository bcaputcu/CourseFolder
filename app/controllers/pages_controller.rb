class PagesController < ApplicationController
	before_filter :authenticate_user!, only: :dashboard

	def home_page
	end

	def dashboard
		@upcoming_tasks = current_user.upcoming_tasks
		@notes = current_user.notes
	end
end
