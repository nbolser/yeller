class MessagesController < ApplicationController
  def index
    @message  = current_user.messages.build
    @messages = Message.message_history
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast('room_channel', text: @message.text, user: @message.user.email)
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
