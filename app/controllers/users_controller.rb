class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def ranking
      @users = User.all.order(points: :desc)
  end

end
