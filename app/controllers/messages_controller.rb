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
    redirect_to conversation_path(@conversation)
  end


  private

  def message_params
  params.require(:message).permit(:content)
  end

end
