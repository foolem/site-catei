class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy, :add_course_to_participant]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # POST /registrations
  # POST /registrations.json
  def create
    if registration_params[:name].blank?
      flash[:error] = "O nome é um campo obgrigatório!"
      redirect_to new_registration_path
      return
    elsif registration_params[:email].blank?
      flash[:error] = "O email é um campo obgrigatório!"
      redirect_to new_registration_path
      return
    elsif registration_params[:cpf].blank?
      flash[:error] = "O CPF é um campo obgrigatório"
      redirect_to new_registration_path
      return
    end
    @registration = Registration.new(registration_params)

    RegistrationMailer.send_qrcode(@registration).deliver

    respond_to do |format|
      if @registration.save
        flash[:success] = "Cadastrado realizado com sucesso!"
        format.html { redirect_to @registration }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def registration_courses
  end

  def participant_search
    if params[:email].blank?
      flash[:error] = "Email não pode estar em branco!"
      redirect_to registration_courses_path
      return
    end
    @participant = Registration.where(email: params[:email]).first
    if !@participant.blank?
      render 'form_courses', participant: @participant
      return
    else
      flash[:error] = "Participante não encontrado! Você já se cadastrou na Semana Acadêmica?"
      redirect_to registration_courses_path
    end
  end

  def add_course_to_participant
    course = Course.find(params[:registration][:course])
    if course.vacancies <= course.registrations.length
      flash[:error] = "Desculpe, mas o curso não possui mais vagas."
      redirect_to registrations_path
      return
    elsif @registration.courses.include?(course)
      flash[:error] = "Você já está inscrito neste curso."
      redirect_to registrations_path
      return
    else
      @registration.courses << course
      @registration.save
      course.vacancies -= 1
      course.save
      flash[:success] = "Inscrito no curso com sucesso!"
      redirect_to registrations_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:name, :grr, :email, :cpf, :turn)
    end
end
