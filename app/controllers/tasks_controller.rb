class TasksController < ApplicationController
	before_filter :get_course
	before_filter :authenticate_user!
	before_filter :check_enrolled, :only => :create

	def new
		@task = current_user.tasks.new(course_id: @course.id)
	end

	def create
		@task = current_user.tasks.new(task_params)
		@task.course = @course

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
		redirect_to (course_path @course), notice: 'You have to be enrolled to the course to do that.' unless current_user.enrolled? @course
	end

	def task_params
		params.require(:task).permit(:name, :start_date, :category)
	end
end
