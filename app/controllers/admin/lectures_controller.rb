class Admin::LecturesController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @lecture = @section.lectures.build
  end

  def create
    @section = Section.find(params[:section_id])
    @lecture = @section.lectures.build(lecture_params)

    if @lecture.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to admin_course_path(@section.course), notice: "レクチャーを追加しました。" }
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

  def lecture_params
    params.require(:lecture).permit(:name)
  end
end
