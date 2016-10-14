class Api::V1::KarmaManagementController < ApplicationController

  before_action :authenticate_user!

  def index
    @karma_requests = KarmaRequest.all
    render json: @karma_request, status: 200
  end


end