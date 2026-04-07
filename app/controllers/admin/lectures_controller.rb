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
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])

    if @lecture.update(lecture_params)
      redirect_to admin_course_path(@lecture.section.course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to admin_course_path(@lecture.section.course), notice: "レクチャーを削除しました。" }
    end
  end

  private

  def lecture_params
    params.require(:lecture).permit(:name)
  end
end
