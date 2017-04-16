class RoomsController < ApplicationController
  def show
  	@room = Room.find(params[:id]) 
  	@message = Message.new
  end

  def index
    @rooms = current_user.rooms
  end

  def create
    userid = params[:user_id].to_i
    #roomに所属しているuserがcurrent_userとusers/showで開かれているuserの2人だけのとき、新しいroomを作らず既存のルームにリダイレクトさせる。
    Room.all.each do |room|
      if room.room_members.count == 2
        if room.room_members.find_by(user_id: current_user.id) != nil and room.room_members.find_by(user_id: userid) != nil
          redirect_to room_path(room.id) and return
        end
      end
    end
    @room = Room.new
    if @room.save
      @room.room_members.where(user_id: current_user.id).first_or_create
      @room.room_members.where(user_id: userid).first_or_create
      redirect_to @room
    end
  end

end
