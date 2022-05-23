class InstructorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response

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

  def render_not_found_response(invalid)
    render json: { errors: invalid }, status: :not_found
  end

  def record_invalid_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

end
