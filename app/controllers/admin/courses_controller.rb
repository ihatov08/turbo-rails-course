class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def show
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path, notice: "コースが作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
