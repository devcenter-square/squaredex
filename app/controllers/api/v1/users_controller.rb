class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    paginate json: current_user, status: 200
  end

  def leaderboard
    @users = User.order_by("karma DESC").limit(20)
    render json: @users, status: 200
  end

end