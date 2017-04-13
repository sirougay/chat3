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

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :action => "edit" 
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :line_id)
    end
end
