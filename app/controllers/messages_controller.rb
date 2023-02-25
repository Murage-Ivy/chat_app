class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def create
    @message = Message.create!(message_params)
    if @message.save
      ActionCable.server.broadcast "chat_channel", content: @message.content, user: @message.user.username
    else
      render json: { error: ["Message not sent"] }, status: :unauthorized
    end
  end

  private

  def message_params
    params.permit(:content, :user_id)
  end
end
