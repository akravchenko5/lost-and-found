class Conversation < ApplicationRecord
  belongs_to :keeper, class_name: 'User', foreign_key: :keeper_id
  belongs_to :seeker, class_name: 'User', foreign_key: :seeker_id
  belongs_to :item
  has_many :messages, dependent: :destroy

  #validates
end
