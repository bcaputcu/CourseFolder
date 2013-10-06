class CoursesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_new_user, only: [:new]
	after_action :section_disable_check, only: [:create, :update]

	def events
		user_section = current_user.sections.find_by course_id: params[:id]
		events_json = DueDate.events_for_sections(user_section.id)

		respond_to do |format|
			format.json {render json: events_json}
		end
	end

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
		new_section = @course.sections.new
		new_section.time_slots.new
	end

	def create
		@course = current_user.school.courses.new(course_params)

		if @course.save
			redirect_to @course
		else
			render action: 'new'
		end
	end

	def edit
		@course = Course.find_by_id(params[:id])
	end

	def update
		@course = Course.find_by_id(params[:id])

		if @course.update_attributes(course_params)
			redirect_to @course
		else
			render action: 'edit'
		end
	end

	private
	def course_params
		params.require(:course).permit(:name, :code, :instructor_name, sections_attributes: [:id, :code, :_destroy, time_slots_attributes: [:id, :start_time, :end_time, :day, :_destroy]])
	end

	def section_disable_check
		if @course.sections_enabled? && !params[:course][:enable_sections]
			@course.disable_sections
		end
	end

end
