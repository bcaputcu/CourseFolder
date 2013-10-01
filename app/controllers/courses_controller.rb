class CoursesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_new_user, only: [:new]

	def index
		@last_5_courses = Course.find(:all, :order => "id desc", :limit => 5).reverse
	end

	def show
		@course = Course.find_by_id(params[:id])

		respond_to do |format|
			if @course
				format.html
			else
				@course = Course.new
				format.html { redirect_to new_course_path, notice: 'Course do not exist. You can create a course from here.'}
			end
		end
	end

	def new
		@course = current_user.school.courses.new
	end

	def create
		@course = current_user.school.courses.new(course_params)

		if @course.save
			redirect_to @course
		else
			render action: 'new'
		end
	end

	private
	def course_params
		params.require(:course).permit(:name, :code, :instructor_name)
	end

end
