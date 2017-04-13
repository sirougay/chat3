class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def index
  	@user = current_user
  	@users = User.where.not(id: current_user.id)
  end

  def edit
  	@user = current_user
  end

end
