class RoomsController < ApplicationController
  def show
    @messages = Message.where(user_id: current_user.id)
    # @messages = Message.all
  end
end
