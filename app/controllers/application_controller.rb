class ApplicationController < ActionController::Base
  helper_method :all_rooms
  before_action :all_rooms

  private 
  
  def all_rooms
    @rooms = Room.all
  end
end
