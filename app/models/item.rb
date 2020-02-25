class Item < ApplicationRecord
  belongs_to :user

  enum state: [:lost, :found, :solved]
end
