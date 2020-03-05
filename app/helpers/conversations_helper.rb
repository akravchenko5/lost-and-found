module ConversationsHelper
  def other_party(conversation)
    user = (current_user == conversation.keeper) ? conversation.seeker : conversation.keeper

    user.first_name
  end
end
