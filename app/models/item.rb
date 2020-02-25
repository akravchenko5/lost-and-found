class Item < ApplicationRecord
  belongs_to :user

  enum state: [:lost, :found, :solved]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
