class Api::V1::KarmaRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_karma_request, only: :update


  def create
    ActiveRecord::Base.transaction do
      validate_create_params
      @karma_request = KarmaRequest.new(params)
      @karma_request.from = current_user.uid
      @karma_request.save
      render @karma_request, status: 201
    end
  end

  def update
    ActiveRecord::Base.transaction do
      validate_update_params
      if @karma_request.approved
        head 403
      else
        @karma_request.update(params)
        render @karma_request, status: 200
      end
    end
  end


  private

  def set_karma_request
    @karma_request = KarmaRequest.find(params[:id])
  end

  def validate_create_params
    param! :reason, String, required: true
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