class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @friend = Friend.where(follower_id: current_user.id, followed_id: @user.id).or(Friend.where(follower_id: @user.id, followed_id: current_user.id)).first
    @room = Room.new(friend_id: @friend.id)
  end

  def index
  	@users = User.where.not(id: current_user.id)
    #友人をサーチする
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
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
