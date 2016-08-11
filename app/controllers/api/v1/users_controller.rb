class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users, status: 200
  end


  def show
    render json: current_user, status: 200
  end

  def leaderboard
    @users = User.order("karma DESC").limit(20)
    render json: @users, status: 200
  end

end