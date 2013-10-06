class PagesController < ApplicationController
	before_action :authenticate_user!, only: :dashboard
	before_action :check_new_user, only: :dashboard

	def home_page
	end

	def dashboard
		@upcoming_tasks = current_user.upcoming_tasks
	end

	def events
		events_json = DueDate.events_for_sections(current_user.sections.pluck(:id))

		respond_to do |format|
			format.json {render json: events_json}
		end
	end

end
