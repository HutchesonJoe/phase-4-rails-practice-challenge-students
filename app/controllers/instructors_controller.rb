class InstructorsController < ApplicationController

  def index
    instructors = Instructor.all 
    render json: instructors
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = Instructor.find_by!(id: params[:id])
    instructor.update(instructor_params)
    render json: instructor
  end

  private

  def instructor_params
    params.permit(:name)
  end

end
