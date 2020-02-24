class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :messages

  # has_many :keeper_relationships, foreign_key: :seeker_id, class_name: 'Conversation'

  # has_many :seeker_relationships, foreign_key: :keeper_id, class_name: 'Conversation'
end
