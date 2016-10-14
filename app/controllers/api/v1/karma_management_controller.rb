class Api::V1::KarmaManagementController < ApplicationController

  def index
    @karma_requests = KarmaRequest.all
    render json: @karma_request, status: 200
  end


end