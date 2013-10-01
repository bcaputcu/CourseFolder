class PagesController < ApplicationController
	before_action :authenticate_user!, only: :dashboard
	before_action :check_new_user, only: :dashboard

	def home_page
	end

	def dashboard
		@upcoming_tasks = current_user.upcoming_tasks
	end

	def check_new_user
		if current_user.flag.new_user
			redirect_to schools_path
		end
	end

end
