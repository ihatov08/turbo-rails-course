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
  end

  def update
  end

  def destroy
  end

  private

  def section_params
    params.require(:section).permit(:name)
  end
end
