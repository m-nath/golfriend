class Event < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :participants, :through => :reservations, :source => :user
  has_many :messages, dependent: :destroy
  has_many :commented_users, :through => :messages, :source =>  :user
  has_many :interested_users, :through => :interests, :source =>  :user

  belongs_to :user

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  mount_uploader :photo, PhotoUploader

  include PgSearch

  pg_search_scope :global_search,
    against: [ :name, :location, :description ],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
