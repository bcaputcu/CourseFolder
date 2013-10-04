class EnrollmentsController < ApplicationController

	before_filter :authenticate_user!

	def create
		@section = Section.find(params[:enrollment][:section_id])
		current_user.enroll! @section
		respond_to do |format|
			format.html { redirect_to @section.course }
			format.js
		end
	end

	def destroy
		@section = Enrollment.find(params[:id]).section
		current_user.drop! @section
		respond_to do |format|
			format.html { redirect_to @section.course }
			format.js
		end
	end
end
