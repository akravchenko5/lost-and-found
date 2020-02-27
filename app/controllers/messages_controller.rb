class MessagesController < ApplicationController
  def index
    #@scope of messages?
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @conversation = Conversation.find(params[:conversation_id])
    @message.conversation = @conversation
    @message.save
    @conversation.save!
    #@conversation_id = @conversation.id
    redirect_to conversation_path(@conversation)
    #needs a conversation to be saved
  end


  private

  def message_params
  params.require(:message).permit(:content, :user_id)
  #require conversation_id?
  end

end
