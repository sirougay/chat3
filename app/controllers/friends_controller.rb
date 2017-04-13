class FriendsController < ApplicationController
	def create
		user = User.find(params[:followed_id])
		current_user.follow(user)
		redirect_to user
	end

	def search
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true).last

	end

end
