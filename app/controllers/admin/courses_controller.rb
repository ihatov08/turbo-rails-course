class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.order(id: :desc)
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
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
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to admin_courses_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
