class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_one_attached :photo


  #, :conversation_id, :user_id


 # def message_time
 #  created_at.strftime(“%m/%d/%y at %l:%M %p”)
 # end
end
