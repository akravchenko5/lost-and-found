class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  has_many :reviews_as_reviewed, foreign_key: :reviewed_id, class_name: 'Review'
  # has_many :reviews_as_reviewer, foreign_key: :reviewer_id, class_name: 'Review'

  # has_many :keeper_relationships, foreign_key: :seeker_id, class_name: 'Conversation'
  # has_many :seeker_relationships, foreign_key: :keeper_id, class_name: 'Conversation'
  has_many :messages, dependent: :destroy

  def conversations
    Conversation.where(seeker: self).or(Conversation.where(keeper: self))
  end

  def conversation_for(item)
    conversations.find_by(item: item)
  end

  def average_rating
    return 0 unless reviews_as_reviewed.any?

    sum = reviews_as_reviewed.sum(:rating)

    rating = sum / reviews_as_reviewed.count

    (rating * 2.0).round / 2.0
  end
end
