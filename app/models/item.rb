class Item < ApplicationRecord

  enum state: [:lost, :found, :solved]

  CATEGORIES = [
    'Animal/Pet',
    'Art',
    'Electronics',
    'Clothes',
    'Funitures',
    'Sports',
    'Transportation',
    'Other'
  ]

  belongs_to :user
  validates :category, inclusion: { in: CATEGORIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
