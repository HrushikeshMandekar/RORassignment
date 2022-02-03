# frozen_string_literal: true

class CoursesController < ApplicationController
  def create
    course = Course.new(course_params)
    if course.save
      render json: course.to_json, status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: Course.all.to_json(include: :tutors), status: :ok
  end

  private

  def course_params
    params.require(:course).permit(:name, tutors_attributes: [:name])
  end
end
