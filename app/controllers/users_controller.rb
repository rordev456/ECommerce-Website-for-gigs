class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @jobs = Job.where(:user_id => current_user.id)
  end

  def show
  	@user = User.where(:id => params[:id])
  end
end
