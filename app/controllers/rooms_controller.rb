class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:notice] = "Room #{@room.name} was created!"
      redirect_to root_path
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

  private

  def find_room
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
