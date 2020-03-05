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
  @conversation = Conversation.find(params[:id])
  @conversation.destroy
    if @conversation.destroy
      flash[:notice] = "Conversation has been deleted!"
      redirect_to conversations_path
    else
      render :index
    end
  end


  def show
    @conversation = Conversation.includes(messages: [:user, :photo_attachment]).where(id: params[:id]).first
  end


  def index
      @conversations = Conversation.joins(:messages).order('messages.created_at desc').uniq {|x| x[:id]}
      # @conversations = Conversation.joins(:messages).merge(Message.order(created_at: :desc)).uniq {|x| x[:id]}
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
