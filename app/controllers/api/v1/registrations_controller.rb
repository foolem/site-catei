module Api::V1
  class RegistrationsController < ApplicationController
    # before_action :authenticate_staff!
    before_action :set_registration, only: [:show, :edit, :update, :destroy, :check_in_course, :check_in_lecture]
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

    def create
      @registration = Registration.new(registration_params)

      respond_to do |format|
        if @registration.save
          format.json { render :show, status: :created, location: @registration }
        else
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @registration.update(registration_params)
          format.json { render :show, status: :ok, location: @registration }
        else
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @registration.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_registration
        @registration = Registration.find(params[:registration_id])
      end

      def set_lecture
        @lecture = Lecture.find(params[:lecture_id]) if !params[:lecture_id].blank?
      end

      def set_course
        @course = Course.find(params[:course_id]) if !params[:course_id].blank?
      end

      def registration_params
        params.require(:registration).permit(:name, :grr, :email, :cpf, :type, :registration_id, :lecture_id, :course_id)
      end
  end
end
