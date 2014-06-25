class UsersController < ApplicationController
  def show
  end

  def ranking
      @users = User.all.order(points: :desc)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
