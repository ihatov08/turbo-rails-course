class Admin::SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @section = @course.sections.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
