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

    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end


  def index
    @conversations = current_user.conversations
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def conversation_params
    params.require(:message).permit(:content)
  end
end