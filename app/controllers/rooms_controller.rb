class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:notice] = "Room #{@room.name} was created!"
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Room #{@room.name} was updated!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @room_message  = Message.new(room: @room)
    @room_messages = @room.messages.includes(:user).last(400)
  end

  def get_current_user
    render json: {name: current_user.id}
  end
  
  private

  def set_room
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
