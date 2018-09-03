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

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        flash[:success] = "Cadastrado realizado com sucesso! Foi enviado um email para #{@registration.email} com seu QRcode."
        format.html { redirect_to @registration }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def registration_courses
  end

  def participant_search
    @participant = Registration.where(email: params[:email]).first
    if !@participant.blank?
      render 'form_courses', participant: @participant
    else
      flash[:error] = "Participante não encontrado! Você já se cadastrou na Semana Acadêmica?"
      redirect_to registrations_path
    end
  end

  def add_course_to_participant
    course = Course.find(params[:registration][:course])
    if course.vacancies <= course.registrations.length
      flash[:error] = "Desculpe, mas o curso não possui mais vagas."
      redirect_to registrations_path
    elsif @registration.courses.include?(course)
      flash[:error] = "Você já está inscrito neste curso."
      redirect_to registrations_path
    else
      @registration.courses << Course.find(params[:registration][:course])
      @registration.save
      flash[:success] = "Curso cadastrado com sucesso!"
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
