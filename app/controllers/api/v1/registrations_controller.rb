module Api::V1
  class RegistrationsController < ApplicationController
    before_action :authenticate_staff!

    before_action :set_registration, only: [:show]
    before_action :set_registration_hash, only: [:check_in_course, :check_in_lecture]
    before_action :set_lecture, only: [:check_in_lecture]
    before_action :set_course, only: [:check_in_course]

    def index
      @registrations = Registration.all
      render json: @registrations, status: :ok
    end

    def check_in_lecture
      @registration.check_in("lecture", @lecture)
      render json: @registration, status: :ok
    end

    def check_in_course
      render json: @registration, status: :not_found if @course.blank?
      @registration.check_in("course", @course)
      render json: @registration, status: :ok
    end

    def show
    end

    private
      def set_registration
        @registration = Registration.find(params[:registration_id])
      end

      def set_registration_hash
        @registration = Registration.find_by(hash_id: params[:registration_id])
      end

      def set_lecture
        @lecture = Lecture.find(params[:lecture_id]) if !params[:lecture_id].blank?
      end

      def set_course
        @course = Course.find(params[:course_id]) if !params[:course_id].blank?
      end

  end
end
