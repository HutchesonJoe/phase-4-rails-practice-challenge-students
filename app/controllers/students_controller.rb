class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response

  def index
    students = Student.all 
    render json: students
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def update
    student = Student.find_by!(id: params[:id])
    student.update(student_params)
    render json: student
  end

  private

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end
 
  #ask Madeline about the difference in the behavior of these two errors and why my validations are working
  def render_not_found_response(invalid)
    render json: { errors: invalid }, status: :not_found
  end

  def record_invalid_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

end
