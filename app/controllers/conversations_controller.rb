class ConversationsController < ApplicationController
  before_action :find_item, only: %i[new create]

  def new
    @message = Message.new
    # need to pass a new message
    # nested in items
  end

  def create
    @conversation = Conversation.create(
      item: @item,
      seeker: current_user,
      keeper: @item.user
    )

    @message = Message.new(conversation_params)
    @message.conversation = @conversation
    @message.user = current_user
    @message.save

    broadcast_message

    redirect_to @conversation
  end

  def show
    @conversation = Conversation.includes(messages: [:user, :photo_attachment]).where(id: params[:id]).first
  end


  def index
    @conversations = current_user.conversations
  end

  private

  def broadcast_message
    ActionCable.server.broadcast(
      "user_#{@conversation.item.user_id}",
      user: current_user.id,
      conversation: @conversation.id,
      notification: render_to_string(partial: 'shared/new_message', locals: { message: @message })
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def conversation_params
    params.require(:message).permit(:content)
  end
end
