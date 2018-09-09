class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  def index
    @lectures = Lecture.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

end
