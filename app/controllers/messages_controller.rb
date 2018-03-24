class MessagesController < ApplicationController
  def index
    @message  = current_user.messages.build
    @messages = Message.message_history
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast('room_channel', text: format_yells, user: @message.user.email)
    else
      render messages_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

  def format_yells
    @message.text.upcase
  end
end
