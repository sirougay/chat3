class RoomsController < ApplicationController
  def show
  	@room = Room.find(params[:id]) 
  	@message = Message.new
  end

  def index
  end

  def create
  	@room = Room.new(room_params)
    @room.save
    redirect_to @room
  end

  private

  	def room_params
  		params.require(:room).permit(:friend_id)
  	end

end
