class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.order(id: :desc)
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
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to admin_courses_path, notice: "コースを作成しました。" }
      end
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
