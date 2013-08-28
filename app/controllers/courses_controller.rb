class CoursesController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

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
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)

		if @course.save
			current_user.enroll! @course
			redirect_to @course
		else
			render action: 'new'
		end
	end

	private
	def course_params
		params.require(:course).permit(:name, :school, :instructor)
	end

end
