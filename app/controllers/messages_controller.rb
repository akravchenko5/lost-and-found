class MessagesController < ApplicationController
  def index
    #@scope of messages?
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
  end


  private

  def message_params
  params.require(:message).permit(:content, :user_id)
  #require conversation_id?
  end

end
