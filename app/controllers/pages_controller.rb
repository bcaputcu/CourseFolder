class PagesController < ApplicationController
	before_action :authenticate_user!, only: :dashboard
	before_action :check_new_user, only: :dashboard

	def home_page
	end

	def dashboard
		@upcoming_tasks = current_user.upcoming_tasks
	end

end
