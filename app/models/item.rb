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

  include AlgoliaSearch

  attr_writer :distance

  def distance
    @distance || 0
  end

  algoliasearch do
    attribute :title, :address, :state, :created_at, :category

    attributesForFaceting [:state]

    geoloc :latitude, :longitude

  end

  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :title, :description, :category, :address, :created_at, :user_id ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
