class UsersController < ApplicationController
  def show
    if request.referer == nil
      redirect_to users_path, alert: "無効なアクセスです。友達はID検索を用いてお探しください。"
    end
  	@user = User.find(params[:id])
    if @friend = Friend.where(follower_id: current_user.id, followed_id: @user.id).or(Friend.where(follower_id: @user.id, followed_id: current_user.id)).first
    end
  end

  def index
  	@users = current_user.following
    #友人をサーチする
     @q = current_user.following.ransack(params[:q])
     @users = @q.result(distinct: true)
  end

  def edit
  	@user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path(@user.id), notice: "変更が保存されました。"
    else
      render :action => "edit" 
    end
  end

  def search
    user = User.where(line_id: params[:line_id]).first
    if user != nil
      redirect_to user_path(user.id)
    else
      redirect_to users_path, notice: "入力したIDのユーザーは存在しません。"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :line_id)
    end
end
