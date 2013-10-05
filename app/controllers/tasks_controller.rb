class TasksController < ApplicationController
	before_filter :get_course
	before_filter :authenticate_user!
	before_filter :check_enrolled, :only => :create

	def new
		@task = current_user.owned_tasks.new(course_id: @course.id)
		@user_section = current_user.sections.find_by course_id: @course.id
		@task.course.sections.each do |section|
			@task.due_dates.new(section_id: section.id )
		end
	end

	def create
		@task = current_user.owned_tasks.new(task_params)
		@task.course = @course
		@user_section = current_user.sections.find_by course_id: @course.id

		if params[:same_due_date_toggle]
			date_to_copy = @task.due_dates.first.expiry_datetime
			@course.sections.where.not(id: @user_section.id).each do |section|
				@task.due_dates.new(section_id: section.id, expiry_datetime: date_to_copy)
			end
		end

		if @task.save
			redirect_to course_path @task.course
		else
			render 'new'
		end
	end


	private
	def get_course
		@course = Course.find(params[:course_id])
	end

	def check_enrolled
		redirect_to (course_path @course), notice: 'You have to be enrolled to the course to do that.' unless current_user.enrolled_to_course? @course
	end

	def task_params
		params.require(:task).permit(:name, :description, :category, due_dates_attributes: [:section_id, :expiry_datetime])
	end
end
