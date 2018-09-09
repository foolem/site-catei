module Api::V1
  class LecturesController < ApplicationController
    before_action :set_lecture, only: [:show]

    def index
      time = (Time.now) # heroku - 3 horas

      @lectures = Lecture.where(day: 12)

      render json: @lectures, status: :ok
    end

    def show
      render json: @lecture, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lecture
        @lecture = Lecture.find(params[:id])
      end

  end
end
