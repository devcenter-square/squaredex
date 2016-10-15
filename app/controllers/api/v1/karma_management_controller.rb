class Api::V1::KarmaManagementController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @karma_requests = KarmaRequest.all
    render json: @karma_requests, status: 200
  end

  def update
    @karma_request = KarmaRequest.find(params[:id])
    @karma_request.update(karma_params)
    render json: @karma_request, status: 200
  end

  private
  def karma_params
    params.require(:karma_request).permit(:approved)
  end
end