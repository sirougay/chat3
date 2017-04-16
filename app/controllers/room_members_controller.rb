class RoomMembersController < ApplicationController
	def new
		@room = Room.find(params[:room_id])
		@room_member = RoomMember.new
	end

	def create
		@room = Room.find(params[:room_id])
		params[:room_member][:user_id].each do |param|
			if param.to_i > 0
				@room.room_members.where(user_id: param.to_i).first_or_create
			end
		end
    redirect_to root_path
	end

	# private
	# 	def room_member_params
	# 		params.permit([:room_member][:user_id])
	# 	end

		# Parameters: {"room_member"=>{"user_id"=>["", "5"]}, "commit"=>"招待", "room_id"=>"33"}
		# room_member: [user_id: :5]
		# <input type="hidden" name="room_member[user_id][]" value="">
end
