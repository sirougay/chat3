class RoomsController < ApplicationController
  def show
  	@room = Room.find(params[:id]) 
  	@message = Message.new
  end


end
