class UsersController < ApplicationController

  before_action :get_current_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

private

  def get_current_user
     @user = User.find(params[:id])
  end

end
