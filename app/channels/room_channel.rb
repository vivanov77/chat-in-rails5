# https://www.pluralsight.com/guides/ruby-ruby-on-rails/creating-a-chat-using-rails-action-cable
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params['user_signed_cookie']}_channel"    
  end
 
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
 
  def process_message_on_server(param_message)

    message = current_user.messages.create!(name: param_message['name'], content: param_message['content'])

    # Debug
    # message = Message.new name: param_message['name'], content: param_message['content']

    ActionCable.server.broadcast "room_#{param_message['user_signed_cookie']}_channel",
                                 message: render_message(message)

  end
 
  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end

end
