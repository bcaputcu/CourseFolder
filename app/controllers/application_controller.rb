class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_new_user
  	if current_user.flag.new_user
  		redirect_to schools_path, notice: "You need to select your school before you start."
  	end
  end

end
