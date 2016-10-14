class Api::V1::KarmaManagementController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @karma_requests = KarmaRequest.all
    render json: @karma_request, status: 200
  end


end