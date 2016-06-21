class KarmaRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_karma_request, only: :update


  def create
    validate_create_params
    @karma_request = KarmaRequest.create(params)
    render @karma_request, status: 201
  end

  def update
    validate_update_params
    if @karma_request.approved
      head 403
    else
      @karma_request.update(params)
      render @karma_request, status: 200
    end
  end


  private

  def set_karma_request
    @karma_request = KarmaRequest.find(params[:id])
  end

  def validate_create_params
    param! :reason, String, required: true
    param! :from, String, required: true
    param! :to, String, required: true
    param! :project_id, Integer, required: true
    param! :karma, Integer
  end

  def validate_update_params
    param! :reason, String
    param! :project_id, Integer
    param! :to, String
  end

end