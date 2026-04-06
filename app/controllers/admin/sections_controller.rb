class Admin::SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @section = @course.sections.build
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.build(section_params)

    if @section.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to admin_course_path(@course), notice: "セクションを追加しました。" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @section = @course.sections.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @section = @course.sections.find(params[:id])

    if @section.update(section_params)
      redirect_to admin_course_path(@course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @section = @course.sections.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to admin_course_path(@course), notice: "セクションを削除しました。" }
    end
  end

  private

  def section_params
    params.require(:section).permit(:name)
  end
end
