require 'pry'
class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @room_message = @room.messages.create(message_params)

    RoomChannel.broadcast_to(@room, @room_message)
  end

  private

  def set_room
    @room = Room.find(params.dig(:message, :room_id))
  end

  def message_params
    params.require(:message).permit(:user_id, :room_id, :message)
  end
end
