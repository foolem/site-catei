module Api::V1
  class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :request_not_found

    def invalid_request
      @response = Hash.new

      @response[:message] = "Invalid request"
      @response[:code] = 400
      @response[:help] = "Invalid request. Please check the docs. ERR: 001"

      return render json: @response, status: 400
    end

    def request_not_found
      @response = Hash.new

      @response[:message] = "Invalid request"
      @response[:code] = 404
      @response[:help] = "Invalid request. Please check the docs. ERR: 002"

      return render json: @response, status: 404
    end

  end
end
