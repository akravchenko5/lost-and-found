class Conversation < ApplicationRecord
  belongs_to :keeper, foreign_key: 'keeper_id', class_name: 'User'
  belongs_to :seeker, foreign_key: 'seeker_id', class_name: 'User'
  belongs_to :item

  has_many :messages

  scope :for_user, ->(user) { where(seeker: user).or(Conversation.where(keeper: user)) }
end
