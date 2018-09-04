module Api::V1
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy, :show]

    def index
      @courses = Course.all
      render json: @courses, status: :ok
    end

    def show
      render json: @course, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def course_params
        params.require(:course).permit(:name, :speaker, :vacancies, :duration)
      end
  end
end
