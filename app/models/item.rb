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
  has_many :conversations, dependent: :destroy
  validates :category, inclusion: { in: CATEGORIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include AlgoliaSearch

  algoliasearch do
    attribute :title, :address, :state, :created_at, :category

    attributesForFaceting [:state]

    geoloc :latitude, :longitude

      ip = "193.214.55.86"

      client = Algolia::Client.new(
        application_id: ENV['ALGOLIA_APP_ID'],
        api_key: ENV['ALGOLIA_SEARCH_KEY']
      )

      client.set_extra_header 'X-Forwarded-For', ip

      index = client.init_index 'index_name'

  end

  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :title, :description, :category, :address, :created_at, :user_id ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
