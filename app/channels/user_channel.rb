class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{params[:user_id]}"
  end
end


# class ConversationChannel < ApplicationCable::Channel
#   def subscribed
#     stream_from "conversation_#{params[:conversation_id]}"
#   end
# end
