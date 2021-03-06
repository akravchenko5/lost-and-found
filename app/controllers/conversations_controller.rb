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

  def destroy
  @conversation = current_user.conversations.find(params[:id])

  @conversation.destroy
    if @conversation.destroy
      flash[:notice] = "Conversation has been deleted!"
      redirect_to conversations_path
    else
      render :index
    end
  end


  def show
    @conversation = current_user.conversations.includes(messages: [:user, :photo_attachment]).where(id: params[:id]).first
    raise ActiveRecord::RecordNotFound unless @conversation.present?
  end


  def index
    @conversations = current_user.conversations.includes(:messages).order('messages.created_at desc')
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
    params.require(:message).permit(:content, :photo)
  end
end
