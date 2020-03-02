class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_#{params[:conversation_id]}"
  end

  # def receive(data)
  #  ActionCable.server.broadcast("conversation_#{params[:conversation_id]}", data)
  # end

  def receive(data)
    message = Message.new(
      user: current_user,
      conversation_id: data['conversation_id'],
      content: data['content']
    )

    if message.save
      ActionCable.server.broadcast(
        "conversation_#{params[:conversation_id]}",
        user: current_user.id,
        message: render(message)
      )
    end
  end

  private

  def render(message)
    renderer = ApplicationController.renderer_with_signed_in_user(current_user)

    renderer.render(
      partial: 'messages/message',
      locals: {
        message: message
      }
    )
  end
end
