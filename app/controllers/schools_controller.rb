class SchoolsController < ApplicationController
  def new
    @school = School.new
  end

  def index
    @schools = School.search params[:search]
  end


  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school
    else
      render action: 'new'
    end
  end

  def show
    @school = School.find_by_id(params[:id])

    respond_to do |format|
      if @school
        format.html
      else
        @school = School.new
        format.html { redirect_to new_school_path, notice: 'School do not exist. You can create a new school from here.'}
      end
    end
  end

  def update
  end

  def destroy
  end

  def enroll
    current_user.enroll_school params[:id]
    redirect_to :root, notice: 'You have successfully selected a school'
  end

  private
  def school_params
    params.require(:school).permit(:name, :country)
  end
end
