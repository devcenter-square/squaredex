class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index

  end


  def show
    render json: current_user, status: 200
  end

  def leaderboard
    @users = User.order_by("karma DESC").limit(20)
    render json: @users, status: 200
  end

end