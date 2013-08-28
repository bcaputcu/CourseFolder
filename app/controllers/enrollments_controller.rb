class EnrollmentsController < ApplicationController

	before_filter :authenticate_user!

	def create
		@course = Course.find(params[:enrollment][:course_id])
		current_user.enroll! @course
		respond_to do |format|
			format.html { redirect_to @course }
			format.js
		end
	end

	def destroy
		@course = Enrollment.find(params[:id]).course
		current_user.drop! @course
		respond_to do |format|
			format.html { redirect_to @course }
			format.js
		end
	end
end
