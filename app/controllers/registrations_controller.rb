class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:add_course_to_participant]
  before_action :set_registration_hash, only: [:satads_confirmation, :courses_confirmation]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
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
    elsif !(Registration.find_by(cpf: registration_params[:cpf]).blank?)
      flash[:error] = "Participante já existente"
      redirect_to new_registration_path
      return
    end
    @registration = Registration.new(registration_params)

    @registration.save

    hash = hashid.encode(@registration.id, 6, 6, 6)
    @registration.hash_id = hash

    @registration.save

    Thread.fork { RegistrationMailer.send_qrcode(@registration).deliver }

    flash[:success] = "Cadastrado realizado com sucesso!"
    redirect_to "/inscricao_satads/#{@registration.hash_id}"
  end

  def satads_confirmation
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
    @course = Course.find(params[:registration][:course])
    if @course.vacancies < 1
      flash[:error] = "Desculpe, mas o curso não possui mais vagas."
      redirect_to registrations_path
      return
    elsif @registration.courses.include?(@course)
      flash[:error] = "Você já está inscrito neste curso."
      redirect_to registrations_path
      return
    end

    @registration.courses << @course
    if @registration.hash_id.blank?
      hash = hashid.encode(@registration.id, 6, 6, 6)
      @registration.hash_id = hash
    end
    @registration.save

    @course.vacancies -= 1
    @course.save

    Thread.fork { RegistrationMailer.send_course_details(@registration, @course).deliver }

    flash[:success] = "Inscrito no curso com sucesso!"
    redirect_to "/inscricao_curso/#{@registration.hash_id}"
  end

  def courses_confirmation
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    def set_registration_hash
      if Registration.where(hash_id: params[:hash]).first.blank?
        flash[:error] = "Não encontrado."
        redirect_to registrations_path
        return
      end
      @registration = Registration.find_by(hash_id: params[:hash])
    end

    def hashid
      Hashids.new("semana academica tads 2018")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:name, :grr, :email, :cpf, :turn)
    end
end
