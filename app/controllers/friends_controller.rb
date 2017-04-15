class FriendsController < ApplicationController
	def create
		#友達になる機能
		user = User.find(params[:followed_id])
		current_user.follow(user)
		redirect_to user
	end
end
