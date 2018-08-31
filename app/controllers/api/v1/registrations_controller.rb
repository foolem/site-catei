module Api::V1
  class RegistrationsController < ApplicationController
    before_action :set_registration, only: [:show, :edit, :update, :destroy, :check_in_course, :check_in_lecture]
    before_action :set_lecture, only: [:check_in_lecture]
    before_action :set_course, only: [:check_in_course]
    # GET /registrations
    # GET /registrations.json
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

    # GET /registrations/1
    # GET /registrations/1.json
    def show
    end

    # GET /registrations/new
    def new
      @registration = Registration.new
    end

    # GET /registrations/1/edit
    def edit
    end

    # POST /registrations
    # POST /registrations.json
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

    # PATCH/PUT /registrations/1
    # PATCH/PUT /registrations/1.json
    def update
      respond_to do |format|
        if @registration.update(registration_params)
          format.json { render :show, status: :ok, location: @registration }
        else
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /registrations/1
    # DELETE /registrations/1.json
    def destroy
      @registration.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_registration
        @registration = Registration.find(params[:registration_id])
      end

      def set_lecture
        @lecture = Lecture.find(params[:lecture_id]) if !params[:lecture_id].blank?
      end

      def set_course
        @course = Course.find(params[:course_id]) if !params[:course_id].blank?
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def registration_params
        params.require(:registration).permit(:name, :grr, :email, :cpf, :type, :registration_id, :lecture_id, :course_id)
      end
  end
end
