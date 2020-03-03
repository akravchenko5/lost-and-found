class MessagesController < ApplicationController
  def index
    #@scope of messages?
  end

  def new
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])

    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = @conversation
    @message.save

    broadcast_message
  end


  private

  def broadcast_message
    ActionCable.server.broadcast(
      "user_#{@message.conversation.seeker_id}",
      conversation: @conversation.id,
      message: render_to_string(partial: 'messages/message', locals: { message: @message, current_user: @message.conversation.seeker }),
      notification: render_to_string(partial: 'shared/new_message', locals: { message: @message })
    )

    ActionCable.server.broadcast(
      "user_#{@message.conversation.keeper_id}",
      conversation: @conversation.id,
      message: render_to_string(partial: 'messages/message', locals: { message: @message, current_user: @message.conversation.keeper  }),
      notification: render_to_string(partial: 'shared/new_message', locals: { message: @message })
    )
  end

  def message_params
    params.require(:message).permit(:content, :photo)
  end
end
