class ConversationsController < ApplicationController
  def new
    #need to pass a message with blank body
  end

  def create
    #pass a mesage with body (message_params)
  end


  def index
  end
end


private

def message_params
  params.require(:message).permit(:content, :user_id)
end
