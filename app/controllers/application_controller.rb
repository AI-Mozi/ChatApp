class ApplicationController < ActionController::Base
  helper_method :all_rooms
  before_action :all_rooms
  before_action :set_online

  private

  def all_rooms
    @rooms = Room.all
  end

  def set_online
    if !!current_user
      $redis_onlines.set( current_user.id, nil, ex: 60 )
    end
  end
end
