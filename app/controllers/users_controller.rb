class UsersController < ApplicationController
  load_and_authorize_resource
  # before_action :authenticate_user!
  # before_action :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
